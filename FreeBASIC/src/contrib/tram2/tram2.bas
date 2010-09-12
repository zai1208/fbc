const FALSE = 0
const TRUE = -1
const NULL = 0
type boolean as integer

const FB_VERSION = "0.22.0"

enum
    TARGET_DOS = 0
    TARGET_LINUX
    TARGET_WIN32
end enum

type TRAMCTX
    as integer target
    as string target_name
    as string exeext

    as string path_prev '' Path to previous FreeBASIC release
    as string path_sys  '' Path to MinGW, DJGPP etc. (to copy libs/binutils from)

    as string fbc
    as string gcc
    as string ar
    as string ranlib

    as string conf_rtlib
    as string conf_gfxlib2
    as string conf_compiler

    as string manifest

    as boolean standalone : 1
    as boolean build      : 1
    as boolean clean      : 1
    as boolean genmanifest: 1
    as boolean archive    : 1
    as boolean installer  : 1
    as boolean deb        : 1
    as boolean source     : 1

    as boolean had_error  : 1
end type

dim shared as TRAMCTX tram

#include once "datetime.bi"
#include once "string.bi"

function strReplace _
    ( _
        byref text as string, _
        byref a as string, _
        byref b as string _
    ) as string

    static as string result
    static as string keep

    result = text

    dim as integer alen = len(a)
    dim as integer blen = len(b)

    dim as integer p = 0
    do
        p = instr(p + 1, result, a)
        if (p = 0) then
            exit do
        end if

        keep = mid(result, p + alen)
        result = left(result, p - 1)
        result += b
        result += keep
        p += blen - 1
    loop

    return result
end function

sub strSplit _
    ( _
        byref s as string, _
        byref delimiter as string, _
        byref l as string, _
        byref r as string _
    )
    dim as integer leftlen = instr(s, delimiter) - 1
    if (leftlen > 0) then
        l = left(s, leftlen)
        r = right(s, len(s) - leftlen - len(delimiter))
    else
        l = s
        r = ""
    end if
end sub

sub sh(byref cmd as string, byval max_good_exitcode as integer = 0)
    if (tram.had_error) then return
    print "    $ ";cmd
    dim as integer exitcode = shell(cmd)
    if (exitcode > max_good_exitcode) then
        print "Error: exit code " + str(exitcode)
        tram.had_error = TRUE
    end if
end sub

sub cd(byref folder as string)
    if (tram.had_error) then return
    print "    $ cd ";folder
    if (chdir(folder)) then
        print "Error: failed to change to '";folder;"'."
        tram.had_error = TRUE
    end if
end sub

sub cp(byref source as string, byref dest as string)
    sh("cp --preserve " + source + " " + dest)
end sub

sub rm(byref file as string)
    sh("rm -f " + file)
end sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

#macro STEP_BEGIN()
    do
#endmacro

#macro STEP_END()
        if (tram.had_error = FALSE) then
            exit do
        end if

        print "Please fix this, then press SPACE to retry or CTRL+C to abort. "
        print "Waiting...";
        while (inkey() <> "") : wend
        sleep
        while (inkey() <> "") : wend
        tram.had_error = FALSE
        print " retrying."
    loop
#endmacro

function getStandaloneTitle() as string
    #ifdef __FB_LINUX__
        if (tram.standalone) then
            return "-standalone"
        end if
    #endif
    return ""
end function

function getTargetTitle() as string
    return tram.target_name + getStandaloneTitle()
end function

function getReleaseTitle() as string
    return "FreeBASIC-" + FB_VERSION + "-" + getTargetTitle()
end function

function getSourceTitle() as string
    return "FreeBASIC-" + FB_VERSION + "-source"
end function

#ifdef __FB_WIN32__
sub checkForTarget(byval argc as integer, byval argv as zstring ptr ptr)
    dim as string arg = ""
    for i as integer = 1 to (argc-1)
        arg = *argv[i]
        select case (arg)
        case "dos"
            tram.target = TARGET_DOS
        end select
    next
end sub
#endif

sub parseArgs(byval argc as integer, byval argv as zstring ptr ptr)
    dim as string arg = ""
    dim as string variable = ""
    dim as string value = ""

    for i as integer = 1 to (argc-1)
        arg = *argv[i]

        select case (arg)
        case "dos"

        case "standalone"
            tram.standalone = TRUE

        case "build"
            tram.build = TRUE

        case "clean"
            tram.clean = TRUE

        case "manifest"
            tram.genmanifest = TRUE

        case "archive"
            tram.archive = TRUE

        case "installer"
            tram.installer = TRUE

        case "deb"
            tram.deb = TRUE

        case "source"
            tram.source = TRUE

        case else
            print "Error: unknown command-line option: '";arg;"'"
            tram.had_error = TRUE

        end select
    next
end sub

sub configure(byref options as string)
    sh("sh ../../configure" + options)
end sub

sub make(byref options as string)
    sh("make" + options)
end sub

sub replacePathVars(byref path as string)
    path = strReplace(path, "<prev>", tram.path_prev)
    path = strReplace(path, "<sys>", tram.path_sys)
end sub

'' Copies in binaries/libraries listed in the binaries-<target>.ini and runs
'' genimplibs.
sub getBinsAndLibs()
    dim as string binariesfile = "src/contrib/tram2/binaries-" + tram.target_name + ".ini"

    if (tram.clean) then
        print "Deleting";
    else
        print "Copying in";
    end if
    print " binaries/libraries listed in '";binariesfile;"'."

    dim as integer f = freefile()
    if (open(binariesfile, for input, as #f)) then
        print "Error: Cannot access '" + binariesfile + "'."
        tram.had_error = TRUE
        return
    end if

    dim as string ln = ""
    dim as string source = ""
    dim as string dest = ""

    while (eof(f) = FALSE)
        line input #f, ln
        ln = trim(ln)

        if (len(ln) > 0) then
            select case (ln[0])
            case asc(";")
                '' Ignore comment

            case asc("[")
                '' [source -> destination] ?
                if (right(ln, 1) = "]") then
                    ln = trim(mid(ln, 2, len(ln)-2))

                    strSplit(ln, " -> ", source, dest)

                    replacePathVars(source)
                    replacePathVars(dest)
                end if

            case else
                STEP_BEGIN()
                    if (tram.clean) then
                        '' Delete the file in our tree.
                        rm(dest + "/" + ln)
                    else
                        '' Copy the file into our tree.
                        cp(source + "/" + ln, dest)
                    end if
                STEP_END()

            end select
        end if
    wend

    close #f

    #ifdef __FB_WIN32__
        if (tram.target = TARGET_WIN32) then
            '' Run genimplibs
            STEP_BEGIN()
                if (tram.clean) then
                    print "Removing import libraries."
                    sh("rm -f lib/win32/*.dll.a")
                else
                    print "Generating import libraries."
                    cd("src/contrib/genimplibs")
                    make("")
                    sh("genimplibs -f -a")
                    cd("../../..")
                end if
            STEP_END()
        end if
    #endif
end sub

sub buildRtlib()
    print "Compiling rtlib."

    cd("src/rtlib/obj/" + tram.target_name)

    STEP_BEGIN()
        configure(" CC=" + tram.gcc + _
                  " AR=" + tram.ar + _
                  " RANLIB=" + tram.ranlib + _
                  tram.conf_rtlib)
    STEP_END()

    STEP_BEGIN()
        make("")
    STEP_END()

    if (tram.target <> TARGET_DOS) then
        STEP_BEGIN()
            make(" MULTITHREADED=1")
        STEP_END()
    end if

    make(" install")

    cd("../../../..")
end sub

sub buildGfxlib()
    print "Compiling gfxlib."

    cd("src/gfxlib2/obj/" + tram.target_name)

    STEP_BEGIN()
        configure(" CC=" + tram.gcc + _
                  " AR=" + tram.ar + _
                  " RANLIB=" + tram.ranlib + _
                  tram.conf_gfxlib2)
    STEP_END()

    STEP_BEGIN()
        make("")
    STEP_END()

    make(" install")

    cd("../../../..")
end sub

sub buildCompiler1()
    print "Compiling fbc."

    cd("src/compiler/obj/" + tram.target_name)

    STEP_BEGIN()
        configure(" FBC=" + tram.fbc + _
                  " CC=" + tram.gcc + _
                  tram.conf_compiler + _
                  " --disable-objinfo")
    STEP_END()

    STEP_BEGIN()
        make("")
    STEP_END()

    make(" install")
    cd("../../../..")
end sub

sub buildCompiler2(byval deb_ready as boolean)
    '' Rebuild fbc with the one that was built before, this fbc will be
    '' built with the tools in the root tree, and linked against the libs
    '' in the root tree.
    print "Re-compiling fbc."

    cd("src/compiler/obj/" + tram.target_name)

    #ifdef __FB_LINUX__
        '' Hack to get the normal (non-standalone) linux fbc to run in the dev
        '' tree, instead of using stuff in /usr/local.
        '' This seems like a better solution then running install.sh -i and
        '' altering the system...
        if (tram.standalone = FALSE) then
            '' Recreate part of the non-standalone directory structure in the dev tree...
            '' include/freebasic is covered by the -i inc.
            cd("../../../..")

            '' lib/freebasic can partly be covered by -p lib/linux, but it's
            '' not enough, because fbc doesn't look for fbrt0.o in lib paths.
            cd("lib")
            sh("mkdir -p freebasic")
            sh("cp -r linux freebasic/linux")
            cd("..")

            cd("src/compiler/obj/linux")
        end if
    #endif

    STEP_BEGIN()
        dim as string fbc = "../../../../fbc" + tram.exeext
        dim as string prefix = ""

        #ifdef __FB_LINUX__
            if (tram.standalone = FALSE) then
                '' Use -prefix to override /usr/local...
                fbc = """" + fbc + " -prefix ../../../.. -i ../../../../inc"""

                '' For non-standalone .deb, use /usr prefix instead of the
                '' default /usr/local.
                if (deb_ready) then
                    prefix = " --prefix=/usr"
                end if
            end if
        #endif

        configure(" FBC=" + fbc + _
                  " CC=" + tram.gcc + _
                  prefix + _
                  tram.conf_compiler)
    STEP_END()

    make(" clean")

    STEP_BEGIN()
        make("")
    STEP_END()

    make(" install")

    cd("../../../..")

    #ifdef __FB_LINUX__
        if (tram.standalone = FALSE) then
            cd("lib")
            sh("rm -r -f freebasic")
            cd("..")
        end if
    #endif
end sub

sub rmLib(byref file as string)
    rm("../../../../lib/" + tram.target_name + "/" + file)
end sub

sub build()
    if (tram.standalone) then
        getBinsAndLibs()
    end if

    if (tram.clean) then
        cd("src/rtlib/obj/" + tram.target_name)
        make(" clean")
        rmLib("libfb.a")
        rmLib("fbrt0.o")
        if (tram.target <> TARGET_DOS) then
            make(" clean MULTITHREADED=1")
            rmLib("libfbmt.a")
        end if

        cd("../../../gfxlib2/obj/" + tram.target_name)
        make(" clean")
        rmLib("libfbgfx.a")
        cd("../../../..")

        cd("src/compiler/obj/" + tram.target_name)
        make(" clean")
        cd("../../../..")

        rm("fbc" + tram.exeext)
    else
        buildRtlib()
        buildGfxlib()
        buildCompiler1()
        buildCompiler2(FALSE)
    end if
end sub

sub applyPattern _
    ( _
        byref manifest as string, _
        byref filelist as string, _
        byref pattern as string, _  
        byval exclude as boolean _
    )

    dim as string cmd = ""
    dim as string temp = "../manifest.tmp"  '' Temporary file used when excluding

    '' Run the files list through the pattern.
    '' Note: using double quotes to prevent quirks with the
    '' cmd.exe escape character '^'.
    cmd = "grep -E """ + pattern + """ "

    if (exclude) then
        '' Excluding: Apply the inversed pattern to
        '' the current manifest (removing from what was gathered
        '' already), and overwrite the current manifest.
        cmd += "-v " + manifest + " > " + temp
    else
        '' Including: Apply the pattern to the whole file list,
        '' append the result to the manifest (duplicates are
        '' removed later).
        cmd += filelist + " >> " + manifest
    end if

    '' grep will return exit code '1' if no matches were found,
    '' so handle this special case as not-an-error. 
    '' On linux a '256' exit code is coming from somewhere,
    '' when not matches were found, weird...
    sh(cmd, 256)

    if (exclude) then
        cp(temp, manifest)
    end if

    rm(temp)
end sub

sub generateManifest(byref manifest as string, byref patternfile as string)
    print "Generating manifest '" + manifest + "' using '";patternfile;"'."

    rm(manifest)

    '' Note: creating temp files outside the tree, otherwise they'd be listed too...
    dim as string filelist = "../filelist.tmp"

    '' Find files (files only, no directories), and remove leading ./, because
    '' find's output looks like:
    ''      ./file.a
    ''      ./dir/file.bas
    '' but we want:
    ''      file.a
    ''      dir/file.bas
    sh("find . -type f | sed 's/^\.\///' > " + filelist)

    '' Read in & apply the regexps
    dim as integer f = freefile()
    if (open(patternfile, for input, as #f)) then
        print "Can't access " + patternfile
        tram.had_error = TRUE
        return
    end if

    dim as string ln = ""
    dim as boolean skipping = FALSE

    while (eof(f) = FALSE)
        line input #f, ln
        ln = trim(ln)

        if (len(ln) > 0) then
            select case (ln[0])
            case asc("+"), asc("-")
                if (skipping = FALSE) then
                    '' '-' means "exclude it".
                    dim as boolean exclude = (ln[0] = asc("-"))

                    '' Cut off +/- at the front.
                    ln = trim(right(ln, len(ln) - 1))

                    '' Replace '<target>' by 'win32' etc.
                    ln = strReplace(ln, "<target>", tram.target_name)

                    applyPattern(manifest, filelist, ln, exclude)
                end if

            '' '[' [Target] ']'
            case asc("[")
                if (right(ln, 1) = "]") then
                    '' Cut off the []'s.
                    ln = trim(mid(ln, 2, len(ln)-2))

                    '' Finding empty []'s/the correct target stops skipping.
                    '' If a different target is found, this section is skipped
                    '' until the next [...].
                    skipping = ((len(ln) > 0) and (ln <> tram.target_name))
                end if

            end select
        end if
    wend

    close #f

    '' Sort: case-insensitive, removing duplicates.
    dim as string temp = "../manifest.tmp"
    sh("sort --ignore-case --unique " + manifest + " > " + temp)
    cp(temp, manifest)
    rm(temp)

    #ifdef __FB_WIN32__
        sh("dos2unix --dos2unix " + manifest)
    #endif

    rm(filelist)
end sub

sub createArchive(byref title as string, byref manifest as string)
    dim as string archive = "../" + title + ".tar.lzma"
    print "Archiving '";archive;"'."

    '' Create archive using LZMA compression
    dim as string ln = "tar -c --lzma"

    '' Prefix all filenames with the <title>/ directory, i.e. put all files
    '' in that directory in the archive.
    ln += " --transform=""s,^," + title + "/,"""

    '' Read input files from the manifest
    ln += " -T " + manifest

    '' Output filename
    ln += " -f " + archive

    sh(ln)
end sub

#ifdef __FB_WIN32__
sub createInstaller()
    cd("src/contrib/installer")
    sh("create.bat")
    cd("../../..")
end sub
#endif

#ifdef __FB_LINUX__
sub createDeb()
    '' But not when standalone is enabled
    if (tram.standalone) then
        return
    end if

    '' Build compiler with /usr prefix.
    buildCompiler2(TRUE)

    cd("src/contrib/deb")
    sh("sh makedeb.sh ../../../../freebasic_" + FB_VERSION + "-1_i386.deb")
    cd("../../..")
end sub
#endif

sub createSourceArchive()
    dim as string title = getSourceTitle()
    dim as string archive = "../" + title + ".tar.lzma"

    print "Creating source code archive '";archive;"'."

    '' Duplicate the working copy
    sh("svn export . " + title)

    '' Create .tar.lzma tarball
    sh("tar -c --lzma -f " + archive + " " + title)

    sh("rm -r -f " + title)
end sub

''
'' main
''
    '' Initialize with defaults
    #ifdef __FB_WIN32__
        tram.target = TARGET_WIN32
    #else
        tram.target = TARGET_LINUX
    #endif

    #ifdef __FB_WIN32__
        checkForTarget(__FB_ARGC__, __FB_ARGV__)
    #endif

    parseArgs(__FB_ARGC__, __FB_ARGV__)

    select case (tram.target)
    case TARGET_DOS
        tram.target_name = "dos"
        tram.exeext = ".exe"

        tram.path_prev = "C:/FreeBASIC-dos-0.20"
        tram.path_sys  = "C:/DJGPP"

        tram.fbc    = "C:/FreeBASIC-dos/fbc.exe"
        tram.gcc    = tram.path_sys + "/bin/gcc.exe"
        tram.ar     = tram.path_sys + "/bin/ar.exe"
        tram.ranlib = tram.path_sys + "/bin/ranlib.exe"

        '' Note: using --host so fbc is called with -target dos, see README.
        tram.conf_rtlib    = " --target=i386-pc-msdosdjgpp --host=i386-pc-msdosdjgpp"
        tram.conf_gfxlib2  = " --target=i386-pc-msdosdjgpp --host=i386-pc-msdosdjgpp"
        tram.conf_compiler = " --target=i386-pc-msdosdjgpp --host=i386-pc-msdosdjgpp"
        tram.standalone = TRUE

    case TARGET_LINUX
        tram.target_name = "linux"
        tram.exeext = ""

        tram.path_sys  = "/usr"
        tram.path_prev = "~/FreeBASIC-0.20" + getStandaloneTitle()

        tram.fbc    = "fbc"
        tram.gcc    = "gcc"
        tram.ar     = "ar"
        tram.ranlib = "ranlib"

    case TARGET_WIN32
        tram.target_name = "win32"
        tram.exeext = ".exe"

        tram.path_sys  = "C:/MinGW"
        tram.path_prev = "C:/FreeBASIC-0.20"

        tram.fbc    = "fbc"
        tram.gcc    = "gcc"
        tram.ar     = "ar"
        tram.ranlib = "ranlib"

        tram.conf_compiler  = " --enable-crosscomp-dos --enable-crosscomp-cygwin"
        tram.standalone = TRUE

    end select

    '' No -g
    tram.conf_rtlib   += " CFLAGS=-O2"
    tram.conf_gfxlib2 += " CFLAGS=-O2"

    '' The default manifest is manifest/<target>.lst.
    tram.manifest = "manifest/" + getTargetTitle() + ".lst"

    '' We always use standalone for dos/win32 targets, but for linux, there is
    '' the 'standalone' tram2 commandline option.
    if (tram.standalone) then
        tram.conf_compiler += " --enable-standalone"
    end if

    '' -------------------------------------------------------------------------

    print "TRAM 2, target ";tram.target_name

    '' Work from the root FreeBASIC directory.
    cd("../../..")

    if (tram.had_error) then
        print "Error, aborting."
        end 1
    end if

    if (tram.build) then
        build()
    end if

    if (tram.clean = FALSE) then
        if (tram.genmanifest) then
            STEP_BEGIN()
                generateManifest(tram.manifest, "src/contrib/tram2/manifest-pattern.ini")
            STEP_END()
        end if

        if (tram.archive) then
            STEP_BEGIN()
                createArchive(getReleaseTitle(), tram.manifest)
            STEP_END()
        end if

        #ifdef __FB_WIN32__
            if (tram.installer) then
                STEP_BEGIN()
                    createInstaller()
                STEP_END()
            end if
        #endif

        #ifdef __FB_LINUX__
            if (tram.deb) then
                STEP_BEGIN()
                    createDeb()
                STEP_END()
            end if
        #endif

        if (tram.source) then
            STEP_BEGIN()
                createSourceArchive()
            STEP_END()
        end if
    end if

    print "Done."