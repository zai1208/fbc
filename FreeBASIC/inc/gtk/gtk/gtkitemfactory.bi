''
''
'' gtkitemfactory -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtkitemfactory_bi__
#define __gtkitemfactory_bi__

#include once "gtk/gtk/gtkwidget.bi"

type GtkTranslateFunc as function cdecl(byval as gchar ptr, byval as gpointer) as gchar
type GtkPrintFunc as sub cdecl(byval as gpointer, byval as gchar ptr)
type GtkItemFactoryCallback as sub cdecl()
type GtkItemFactoryCallback1 as sub cdecl(byval as gpointer, byval as guint, byval as GtkWidget ptr)
type GtkItemFactory as _GtkItemFactory
type GtkItemFactoryClass as _GtkItemFactoryClass
type GtkItemFactoryEntry as _GtkItemFactoryEntry
type GtkItemFactoryItem as _GtkItemFactoryItem

type _GtkItemFactory
	object as GtkObject
	path as gchar ptr
	accel_group as GtkAccelGroup ptr
	widget as GtkWidget ptr
	items as GSList ptr
	translate_func as GtkTranslateFunc
	translate_data as gpointer
	translate_notify as GtkDestroyNotify
end type

type _GtkItemFactoryClass
	object_class as GtkObjectClass
	item_ht as GHashTable ptr
	_gtk_reserved1 as sub cdecl()
	_gtk_reserved2 as sub cdecl()
	_gtk_reserved3 as sub cdecl()
	_gtk_reserved4 as sub cdecl()
end type

type _GtkItemFactoryEntry
	path as gchar ptr
	accelerator as gchar ptr
	callback as GtkItemFactoryCallback
	callback_action as guint
	item_type as gchar ptr
	extra_data as gconstpointer
end type

type _GtkItemFactoryItem
	path as gchar ptr
	widgets as GSList ptr
end type

declare function gtk_item_factory_get_type cdecl alias "gtk_item_factory_get_type" () as GType
declare function gtk_item_factory_new cdecl alias "gtk_item_factory_new" (byval container_type as GType, byval path as gchar ptr, byval accel_group as GtkAccelGroup ptr) as GtkItemFactory ptr
declare sub gtk_item_factory_construct cdecl alias "gtk_item_factory_construct" (byval ifactory as GtkItemFactory ptr, byval container_type as GType, byval path as gchar ptr, byval accel_group as GtkAccelGroup ptr)
declare sub gtk_item_factory_add_foreign cdecl alias "gtk_item_factory_add_foreign" (byval accel_widget as GtkWidget ptr, byval full_path as gchar ptr, byval accel_group as GtkAccelGroup ptr, byval keyval as guint, byval modifiers as GdkModifierType)
declare function gtk_item_factory_from_widget cdecl alias "gtk_item_factory_from_widget" (byval widget as GtkWidget ptr) as GtkItemFactory ptr
declare function gtk_item_factory_path_from_widget cdecl alias "gtk_item_factory_path_from_widget" (byval widget as GtkWidget ptr) as gchar ptr
declare function gtk_item_factory_get_item cdecl alias "gtk_item_factory_get_item" (byval ifactory as GtkItemFactory ptr, byval path as gchar ptr) as GtkWidget ptr
declare function gtk_item_factory_get_widget cdecl alias "gtk_item_factory_get_widget" (byval ifactory as GtkItemFactory ptr, byval path as gchar ptr) as GtkWidget ptr
declare function gtk_item_factory_get_widget_by_action cdecl alias "gtk_item_factory_get_widget_by_action" (byval ifactory as GtkItemFactory ptr, byval action as guint) as GtkWidget ptr
declare function gtk_item_factory_get_item_by_action cdecl alias "gtk_item_factory_get_item_by_action" (byval ifactory as GtkItemFactory ptr, byval action as guint) as GtkWidget ptr
declare sub gtk_item_factory_create_item cdecl alias "gtk_item_factory_create_item" (byval ifactory as GtkItemFactory ptr, byval entry as GtkItemFactoryEntry ptr, byval callback_data as gpointer, byval callback_type as guint)
declare sub gtk_item_factory_create_items cdecl alias "gtk_item_factory_create_items" (byval ifactory as GtkItemFactory ptr, byval n_entries as guint, byval entries as GtkItemFactoryEntry ptr, byval callback_data as gpointer)
declare sub gtk_item_factory_delete_item cdecl alias "gtk_item_factory_delete_item" (byval ifactory as GtkItemFactory ptr, byval path as gchar ptr)
declare sub gtk_item_factory_delete_entry cdecl alias "gtk_item_factory_delete_entry" (byval ifactory as GtkItemFactory ptr, byval entry as GtkItemFactoryEntry ptr)
declare sub gtk_item_factory_delete_entries cdecl alias "gtk_item_factory_delete_entries" (byval ifactory as GtkItemFactory ptr, byval n_entries as guint, byval entries as GtkItemFactoryEntry ptr)
declare sub gtk_item_factory_popup cdecl alias "gtk_item_factory_popup" (byval ifactory as GtkItemFactory ptr, byval x as guint, byval y as guint, byval mouse_button as guint, byval time_ as guint32)
declare sub gtk_item_factory_popup_with_data cdecl alias "gtk_item_factory_popup_with_data" (byval ifactory as GtkItemFactory ptr, byval popup_data as gpointer, byval destroy as GtkDestroyNotify, byval x as guint, byval y as guint, byval mouse_button as guint, byval time_ as guint32)
declare function gtk_item_factory_popup_data cdecl alias "gtk_item_factory_popup_data" (byval ifactory as GtkItemFactory ptr) as gpointer
declare function gtk_item_factory_popup_data_from_widget cdecl alias "gtk_item_factory_popup_data_from_widget" (byval widget as GtkWidget ptr) as gpointer
declare sub gtk_item_factory_set_translate_func cdecl alias "gtk_item_factory_set_translate_func" (byval ifactory as GtkItemFactory ptr, byval func as GtkTranslateFunc, byval data as gpointer, byval notify as GtkDestroyNotify)

type GtkMenuCallback as sub cdecl(byval as GtkWidget ptr, byval as gpointer)

type GtkMenuEntry
	path as gchar ptr
	accelerator as gchar ptr
	callback as GtkMenuCallback
	callback_data as gpointer
	widget as GtkWidget ptr
end type

type GtkItemFactoryCallback2 as sub cdecl(byval as GtkWidget ptr, byval as gpointer, byval as guint)

declare sub gtk_item_factory_create_items_ac cdecl alias "gtk_item_factory_create_items_ac" (byval ifactory as GtkItemFactory ptr, byval n_entries as guint, byval entries as GtkItemFactoryEntry ptr, byval callback_data as gpointer, byval callback_type as guint)
declare function gtk_item_factory_from_path cdecl alias "gtk_item_factory_from_path" (byval path as gchar ptr) as GtkItemFactory ptr
declare sub gtk_item_factory_create_menu_entries cdecl alias "gtk_item_factory_create_menu_entries" (byval n_entries as guint, byval entries as GtkMenuEntry ptr)
declare sub gtk_item_factories_path_delete cdecl alias "gtk_item_factories_path_delete" (byval ifactory_path as gchar ptr, byval path as gchar ptr)

#endif
