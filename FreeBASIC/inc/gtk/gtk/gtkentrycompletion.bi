''
''
'' gtkentrycompletion -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtkentrycompletion_bi__
#define __gtkentrycompletion_bi__

#include once "gtk/glib-object.bi"
#include once "gtk/gtk/gtktreemodel.bi"
#include once "gtk/gtk/gtkliststore.bi"
#include once "gtk/gtk/gtktreeviewcolumn.bi"
#include once "gtk/gtk/gtktreemodelfilter.bi"

type GtkEntryCompletion as _GtkEntryCompletion
type GtkEntryCompletionClass as _GtkEntryCompletionClass
type GtkEntryCompletionPrivate as _GtkEntryCompletionPrivate
type GtkEntryCompletionMatchFunc as function cdecl(byval as GtkEntryCompletion ptr, byval as gchar ptr, byval as GtkTreeIter ptr, byval as gpointer) as gboolean

type _GtkEntryCompletion
	parent_instance as GObject
	priv as GtkEntryCompletionPrivate ptr
end type

type _GtkEntryCompletionClass
	parent_class as GObjectClass
	match_selected as function cdecl(byval as GtkEntryCompletion ptr, byval as GtkTreeModel ptr, byval as GtkTreeIter ptr) as gboolean
	action_activated as sub cdecl(byval as GtkEntryCompletion ptr, byval as gint)
	insert_prefix as function cdecl(byval as GtkEntryCompletion ptr, byval as gchar ptr) as gboolean
	_gtk_reserved0 as sub cdecl()
	_gtk_reserved1 as sub cdecl()
	_gtk_reserved2 as sub cdecl()
end type

declare function gtk_entry_completion_get_type cdecl alias "gtk_entry_completion_get_type" () as GType
declare function gtk_entry_completion_new cdecl alias "gtk_entry_completion_new" () as GtkEntryCompletion ptr
declare function gtk_entry_completion_get_entry cdecl alias "gtk_entry_completion_get_entry" (byval completion as GtkEntryCompletion ptr) as GtkWidget ptr
declare sub gtk_entry_completion_set_model cdecl alias "gtk_entry_completion_set_model" (byval completion as GtkEntryCompletion ptr, byval model as GtkTreeModel ptr)
declare function gtk_entry_completion_get_model cdecl alias "gtk_entry_completion_get_model" (byval completion as GtkEntryCompletion ptr) as GtkTreeModel ptr
declare sub gtk_entry_completion_set_match_func cdecl alias "gtk_entry_completion_set_match_func" (byval completion as GtkEntryCompletion ptr, byval func as GtkEntryCompletionMatchFunc, byval func_data as gpointer, byval func_notify as GDestroyNotify)
declare sub gtk_entry_completion_set_minimum_key_length cdecl alias "gtk_entry_completion_set_minimum_key_length" (byval completion as GtkEntryCompletion ptr, byval length as gint)
declare function gtk_entry_completion_get_minimum_key_length cdecl alias "gtk_entry_completion_get_minimum_key_length" (byval completion as GtkEntryCompletion ptr) as gint
declare sub gtk_entry_completion_complete cdecl alias "gtk_entry_completion_complete" (byval completion as GtkEntryCompletion ptr)
declare sub gtk_entry_completion_insert_prefix cdecl alias "gtk_entry_completion_insert_prefix" (byval completion as GtkEntryCompletion ptr)
declare sub gtk_entry_completion_insert_action_text cdecl alias "gtk_entry_completion_insert_action_text" (byval completion as GtkEntryCompletion ptr, byval index_ as gint, byval text as gchar ptr)
declare sub gtk_entry_completion_insert_action_markup cdecl alias "gtk_entry_completion_insert_action_markup" (byval completion as GtkEntryCompletion ptr, byval index_ as gint, byval markup as gchar ptr)
declare sub gtk_entry_completion_delete_action cdecl alias "gtk_entry_completion_delete_action" (byval completion as GtkEntryCompletion ptr, byval index_ as gint)
declare sub gtk_entry_completion_set_inline_completion cdecl alias "gtk_entry_completion_set_inline_completion" (byval completion as GtkEntryCompletion ptr, byval inline_completion as gboolean)
declare function gtk_entry_completion_get_inline_completion cdecl alias "gtk_entry_completion_get_inline_completion" (byval completion as GtkEntryCompletion ptr) as gboolean
declare sub gtk_entry_completion_set_popup_completion cdecl alias "gtk_entry_completion_set_popup_completion" (byval completion as GtkEntryCompletion ptr, byval popup_completion as gboolean)
declare function gtk_entry_completion_get_popup_completion cdecl alias "gtk_entry_completion_get_popup_completion" (byval completion as GtkEntryCompletion ptr) as gboolean
declare sub gtk_entry_completion_set_text_column cdecl alias "gtk_entry_completion_set_text_column" (byval completion as GtkEntryCompletion ptr, byval column as gint)
declare function gtk_entry_completion_get_text_column cdecl alias "gtk_entry_completion_get_text_column" (byval completion as GtkEntryCompletion ptr) as gint

#endif
