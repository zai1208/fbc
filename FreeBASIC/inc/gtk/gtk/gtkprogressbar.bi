''
''
'' gtkprogressbar -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtkprogressbar_bi__
#define __gtkprogressbar_bi__

#include once "gtk/gdk.bi"
#include once "gtk/gtk/gtkprogress.bi"

type GtkProgressBar as _GtkProgressBar
type GtkProgressBarClass as _GtkProgressBarClass

enum GtkProgressBarStyle
	GTK_PROGRESS_CONTINUOUS
	GTK_PROGRESS_DISCRETE
end enum


enum GtkProgressBarOrientation
	GTK_PROGRESS_LEFT_TO_RIGHT
	GTK_PROGRESS_RIGHT_TO_LEFT
	GTK_PROGRESS_BOTTOM_TO_TOP
	GTK_PROGRESS_TOP_TO_BOTTOM
end enum


type _GtkProgressBar
	progress as GtkProgress
	bar_style as GtkProgressBarStyle
	orientation as GtkProgressBarOrientation
	blocks as guint
	in_block as gint
	activity_pos as gint
	activity_step as guint
	activity_blocks as guint
	pulse_fraction as gdouble
	activity_dir as guint
	ellipsize as guint
end type

type _GtkProgressBarClass
	parent_class as GtkProgressClass
	_gtk_reserved1 as sub cdecl()
	_gtk_reserved2 as sub cdecl()
	_gtk_reserved3 as sub cdecl()
	_gtk_reserved4 as sub cdecl()
end type

declare function gtk_progress_bar_get_type cdecl alias "gtk_progress_bar_get_type" () as GType
declare function gtk_progress_bar_new cdecl alias "gtk_progress_bar_new" () as GtkWidget ptr
declare sub gtk_progress_bar_pulse cdecl alias "gtk_progress_bar_pulse" (byval pbar as GtkProgressBar ptr)
declare sub gtk_progress_bar_set_text cdecl alias "gtk_progress_bar_set_text" (byval pbar as GtkProgressBar ptr, byval text as gchar ptr)
declare sub gtk_progress_bar_set_fraction cdecl alias "gtk_progress_bar_set_fraction" (byval pbar as GtkProgressBar ptr, byval fraction as gdouble)
declare sub gtk_progress_bar_set_pulse_step cdecl alias "gtk_progress_bar_set_pulse_step" (byval pbar as GtkProgressBar ptr, byval fraction as gdouble)
declare sub gtk_progress_bar_set_orientation cdecl alias "gtk_progress_bar_set_orientation" (byval pbar as GtkProgressBar ptr, byval orientation as GtkProgressBarOrientation)
declare function gtk_progress_bar_get_text cdecl alias "gtk_progress_bar_get_text" (byval pbar as GtkProgressBar ptr) as gchar ptr
declare function gtk_progress_bar_get_fraction cdecl alias "gtk_progress_bar_get_fraction" (byval pbar as GtkProgressBar ptr) as gdouble
declare function gtk_progress_bar_get_pulse_step cdecl alias "gtk_progress_bar_get_pulse_step" (byval pbar as GtkProgressBar ptr) as gdouble
declare function gtk_progress_bar_get_orientation cdecl alias "gtk_progress_bar_get_orientation" (byval pbar as GtkProgressBar ptr) as GtkProgressBarOrientation
declare sub gtk_progress_bar_set_ellipsize cdecl alias "gtk_progress_bar_set_ellipsize" (byval pbar as GtkProgressBar ptr, byval mode as PangoEllipsizeMode)
declare function gtk_progress_bar_get_ellipsize cdecl alias "gtk_progress_bar_get_ellipsize" (byval pbar as GtkProgressBar ptr) as PangoEllipsizeMode
declare function gtk_progress_bar_new_with_adjustment cdecl alias "gtk_progress_bar_new_with_adjustment" (byval adjustment as GtkAdjustment ptr) as GtkWidget ptr
declare sub gtk_progress_bar_set_bar_style cdecl alias "gtk_progress_bar_set_bar_style" (byval pbar as GtkProgressBar ptr, byval style as GtkProgressBarStyle)
declare sub gtk_progress_bar_set_discrete_blocks cdecl alias "gtk_progress_bar_set_discrete_blocks" (byval pbar as GtkProgressBar ptr, byval blocks as guint)
declare sub gtk_progress_bar_set_activity_step cdecl alias "gtk_progress_bar_set_activity_step" (byval pbar as GtkProgressBar ptr, byval step as guint)
declare sub gtk_progress_bar_set_activity_blocks cdecl alias "gtk_progress_bar_set_activity_blocks" (byval pbar as GtkProgressBar ptr, byval blocks as guint)
declare sub gtk_progress_bar_update cdecl alias "gtk_progress_bar_update" (byval pbar as GtkProgressBar ptr, byval percentage as gdouble)

#endif
