''
''
'' gtktreeselection -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtktreeselection_bi__
#define __gtktreeselection_bi__

#include once "gtk/glib-object.bi"
#include once "gtk/gtk/gtktreeview.bi"

type GtkTreeSelectionFunc as function cdecl(byval as GtkTreeSelection ptr, byval as GtkTreeModel ptr, byval as GtkTreePath ptr, byval as gboolean, byval as gpointer) as gboolean
type GtkTreeSelectionForeachFunc as sub cdecl(byval as GtkTreeModel ptr, byval as GtkTreePath ptr, byval as GtkTreeIter ptr, byval as gpointer)

type _GtkTreeSelection
	parent as GObject
	tree_view as GtkTreeView ptr
	type as GtkSelectionMode
	user_func as GtkTreeSelectionFunc
	user_data as gpointer
	destroy as GtkDestroyNotify
end type

type _GtkTreeSelectionClass
	parent_class as GObjectClass
	changed as sub cdecl(byval as GtkTreeSelection ptr)
	_gtk_reserved1 as sub cdecl()
	_gtk_reserved2 as sub cdecl()
	_gtk_reserved3 as sub cdecl()
	_gtk_reserved4 as sub cdecl()
end type

declare function gtk_tree_selection_get_type cdecl alias "gtk_tree_selection_get_type" () as GType
declare sub gtk_tree_selection_set_mode cdecl alias "gtk_tree_selection_set_mode" (byval selection as GtkTreeSelection ptr, byval type as GtkSelectionMode)
declare function gtk_tree_selection_get_mode cdecl alias "gtk_tree_selection_get_mode" (byval selection as GtkTreeSelection ptr) as GtkSelectionMode
declare sub gtk_tree_selection_set_select_function cdecl alias "gtk_tree_selection_set_select_function" (byval selection as GtkTreeSelection ptr, byval func as GtkTreeSelectionFunc, byval data as gpointer, byval destroy as GtkDestroyNotify)
declare function gtk_tree_selection_get_user_data cdecl alias "gtk_tree_selection_get_user_data" (byval selection as GtkTreeSelection ptr) as gpointer
declare function gtk_tree_selection_get_tree_view cdecl alias "gtk_tree_selection_get_tree_view" (byval selection as GtkTreeSelection ptr) as GtkTreeView ptr
declare function gtk_tree_selection_get_selected cdecl alias "gtk_tree_selection_get_selected" (byval selection as GtkTreeSelection ptr, byval model as GtkTreeModel ptr ptr, byval iter as GtkTreeIter ptr) as gboolean
declare function gtk_tree_selection_get_selected_rows cdecl alias "gtk_tree_selection_get_selected_rows" (byval selection as GtkTreeSelection ptr, byval model as GtkTreeModel ptr ptr) as GList ptr
declare function gtk_tree_selection_count_selected_rows cdecl alias "gtk_tree_selection_count_selected_rows" (byval selection as GtkTreeSelection ptr) as gint
declare sub gtk_tree_selection_selected_foreach cdecl alias "gtk_tree_selection_selected_foreach" (byval selection as GtkTreeSelection ptr, byval func as GtkTreeSelectionForeachFunc, byval data as gpointer)
declare sub gtk_tree_selection_select_path cdecl alias "gtk_tree_selection_select_path" (byval selection as GtkTreeSelection ptr, byval path as GtkTreePath ptr)
declare sub gtk_tree_selection_unselect_path cdecl alias "gtk_tree_selection_unselect_path" (byval selection as GtkTreeSelection ptr, byval path as GtkTreePath ptr)
declare sub gtk_tree_selection_select_iter cdecl alias "gtk_tree_selection_select_iter" (byval selection as GtkTreeSelection ptr, byval iter as GtkTreeIter ptr)
declare sub gtk_tree_selection_unselect_iter cdecl alias "gtk_tree_selection_unselect_iter" (byval selection as GtkTreeSelection ptr, byval iter as GtkTreeIter ptr)
declare function gtk_tree_selection_path_is_selected cdecl alias "gtk_tree_selection_path_is_selected" (byval selection as GtkTreeSelection ptr, byval path as GtkTreePath ptr) as gboolean
declare function gtk_tree_selection_iter_is_selected cdecl alias "gtk_tree_selection_iter_is_selected" (byval selection as GtkTreeSelection ptr, byval iter as GtkTreeIter ptr) as gboolean
declare sub gtk_tree_selection_select_all cdecl alias "gtk_tree_selection_select_all" (byval selection as GtkTreeSelection ptr)
declare sub gtk_tree_selection_unselect_all cdecl alias "gtk_tree_selection_unselect_all" (byval selection as GtkTreeSelection ptr)
declare sub gtk_tree_selection_select_range cdecl alias "gtk_tree_selection_select_range" (byval selection as GtkTreeSelection ptr, byval start_path as GtkTreePath ptr, byval end_path as GtkTreePath ptr)
declare sub gtk_tree_selection_unselect_range cdecl alias "gtk_tree_selection_unselect_range" (byval selection as GtkTreeSelection ptr, byval start_path as GtkTreePath ptr, byval end_path as GtkTreePath ptr)

#endif
