''
''
'' gtkstock -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtkstock_bi__
#define __gtkstock_bi__

#include once "gtk/gdk.bi"

type GtkStockItem as _GtkStockItem

type _GtkStockItem
	stock_id as gchar ptr
	label as gchar ptr
	modifier as GdkModifierType
	keyval as guint
	translation_domain as gchar ptr
end type

declare sub gtk_stock_add cdecl alias "gtk_stock_add" (byval items as GtkStockItem ptr, byval n_items as guint)
declare sub gtk_stock_add_static cdecl alias "gtk_stock_add_static" (byval items as GtkStockItem ptr, byval n_items as guint)
declare function gtk_stock_lookup cdecl alias "gtk_stock_lookup" (byval stock_id as gchar ptr, byval item as GtkStockItem ptr) as gboolean
declare function gtk_stock_list_ids cdecl alias "gtk_stock_list_ids" () as GSList ptr
declare function gtk_stock_item_copy cdecl alias "gtk_stock_item_copy" (byval item as GtkStockItem ptr) as GtkStockItem ptr
declare sub gtk_stock_item_free cdecl alias "gtk_stock_item_free" (byval item as GtkStockItem ptr)

#define GTK_STOCK_DIALOG_AUTHENTICATION "gtk-dialog-authentication"
#define GTK_STOCK_DIALOG_INFO "gtk-dialog-info"
#define GTK_STOCK_DIALOG_WARNING "gtk-dialog-warning"
#define GTK_STOCK_DIALOG_ERROR "gtk-dialog-error"
#define GTK_STOCK_DIALOG_QUESTION "gtk-dialog-question"
#define GTK_STOCK_DND "gtk-dnd"
#define GTK_STOCK_DND_MULTIPLE "gtk-dnd-multiple"
#define GTK_STOCK_ABOUT "gtk-about"
#define GTK_STOCK_ADD_ "gtk-add"
#define GTK_STOCK_APPLY "gtk-apply"
#define GTK_STOCK_BOLD "gtk-bold"
#define GTK_STOCK_CANCEL "gtk-cancel"
#define GTK_STOCK_CDROM "gtk-cdrom"
#define GTK_STOCK_CLEAR "gtk-clear"
#define GTK_STOCK_CLOSE "gtk-close"
#define GTK_STOCK_COLOR_PICKER "gtk-color-picker"
#define GTK_STOCK_CONVERT "gtk-convert"
#define GTK_STOCK_CONNECT "gtk-connect"
#define GTK_STOCK_COPY "gtk-copy"
#define GTK_STOCK_CUT "gtk-cut"
#define GTK_STOCK_DELETE "gtk-delete"
#define GTK_STOCK_DIRECTORY "gtk-directory"
#define GTK_STOCK_DISCONNECT "gtk-disconnect"
#define GTK_STOCK_EDIT "gtk-edit"
#define GTK_STOCK_EXECUTE "gtk-execute"
#define GTK_STOCK_FILE "gtk-file"
#define GTK_STOCK_FIND "gtk-find"
#define GTK_STOCK_FIND_AND_REPLACE "gtk-find-and-replace"
#define GTK_STOCK_FLOPPY "gtk-floppy"
#define GTK_STOCK_GOTO_BOTTOM "gtk-goto-bottom"
#define GTK_STOCK_GOTO_FIRST "gtk-goto-first"
#define GTK_STOCK_GOTO_LAST "gtk-goto-last"
#define GTK_STOCK_GOTO_TOP "gtk-goto-top"
#define GTK_STOCK_GO_BACK "gtk-go-back"
#define GTK_STOCK_GO_DOWN "gtk-go-down"
#define GTK_STOCK_GO_FORWARD "gtk-go-forward"
#define GTK_STOCK_GO_UP "gtk-go-up"
#define GTK_STOCK_HARDDISK "gtk-harddisk"
#define GTK_STOCK_HELP "gtk-help"
#define GTK_STOCK_HOME "gtk-home"
#define GTK_STOCK_INDEX "gtk-index"
#define GTK_STOCK_INDENT "gtk-indent"
#define GTK_STOCK_UNINDENT "gtk-unindent"
#define GTK_STOCK_ITALIC "gtk-italic"
#define GTK_STOCK_JUMP_TO "gtk-jump-to"
#define GTK_STOCK_JUSTIFY_CENTER "gtk-justify-center"
#define GTK_STOCK_JUSTIFY_FILL "gtk-justify-fill"
#define GTK_STOCK_JUSTIFY_LEFT "gtk-justify-left"
#define GTK_STOCK_JUSTIFY_RIGHT "gtk-justify-right"
#define GTK_STOCK_MISSING_IMAGE "gtk-missing-image"
#define GTK_STOCK_MEDIA_FORWARD "gtk-media-forward"
#define GTK_STOCK_MEDIA_NEXT "gtk-media-next"
#define GTK_STOCK_MEDIA_PAUSE "gtk-media-pause"
#define GTK_STOCK_MEDIA_PLAY "gtk-media-play"
#define GTK_STOCK_MEDIA_PREVIOUS "gtk-media-previous"
#define GTK_STOCK_MEDIA_RECORD "gtk-media-record"
#define GTK_STOCK_MEDIA_REWIND "gtk-media-rewind"
#define GTK_STOCK_MEDIA_STOP "gtk-media-stop"
#define GTK_STOCK_NETWORK "gtk-network"
#define GTK_STOCK_NEW "gtk-new"
#define GTK_STOCK_NO "gtk-no"
#define GTK_STOCK_OK "gtk-ok"
#define GTK_STOCK_OPEN "gtk-open"
#define GTK_STOCK_PASTE "gtk-paste"
#define GTK_STOCK_PREFERENCES "gtk-preferences"
#define GTK_STOCK_PRINT "gtk-print"
#define GTK_STOCK_PRINT_PREVIEW "gtk-print-preview"
#define GTK_STOCK_PROPERTIES "gtk-properties"
#define GTK_STOCK_QUIT "gtk-quit"
#define GTK_STOCK_REDO "gtk-redo"
#define GTK_STOCK_REFRESH "gtk-refresh"
#define GTK_STOCK_REMOVE "gtk-remove"
#define GTK_STOCK_REVERT_TO_SAVED "gtk-revert-to-saved"
#define GTK_STOCK_SAVE "gtk-save"
#define GTK_STOCK_SAVE_AS "gtk-save-as"
#define GTK_STOCK_SELECT_COLOR "gtk-select-color"
#define GTK_STOCK_SELECT_FONT "gtk-select-font"
#define GTK_STOCK_SORT_ASCENDING "gtk-sort-ascending"
#define GTK_STOCK_SORT_DESCENDING "gtk-sort-descending"
#define GTK_STOCK_SPELL_CHECK "gtk-spell-check"
#define GTK_STOCK_STOP "gtk-stop"
#define GTK_STOCK_STRIKETHROUGH "gtk-strikethrough"
#define GTK_STOCK_UNDELETE "gtk-undelete"
#define GTK_STOCK_UNDERLINE "gtk-underline"
#define GTK_STOCK_UNDO "gtk-undo"
#define GTK_STOCK_YES "gtk-yes"
#define GTK_STOCK_ZOOM_100 "gtk-zoom-100"
#define GTK_STOCK_ZOOM_FIT "gtk-zoom-fit"
#define GTK_STOCK_ZOOM_IN "gtk-zoom-in"
#define GTK_STOCK_ZOOM_OUT "gtk-zoom-out"

#endif
