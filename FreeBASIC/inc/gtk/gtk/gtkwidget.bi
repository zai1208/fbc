''
''
'' gtkwidget -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtkwidget_bi__
#define __gtkwidget_bi__

#include once "gtk/gdk.bi"
#include once "gtk/gtk/gtkaccelgroup.bi"
#include once "gtk/gtk/gtkobject.bi"
#include once "gtk/gtk/gtkadjustment.bi"
#include once "gtk/gtk/gtkstyle.bi"
#include once "gtk/gtk/gtksettings.bi"
'''''''' #include once "gtk/gtk/atk/atkobject.bi"

#ifndef AtkObject
type AtkObject as any
#endif

enum GtkWidgetFlags
	GTK_TOPLEVEL = 1 shl 4
	GTK_NO_WINDOW = 1 shl 5
	GTK_REALIZED = 1 shl 6
	GTK_MAPPED = 1 shl 7
	GTK_VISIBLE = 1 shl 8
	GTK_SENSITIVE = 1 shl 9
	GTK_PARENT_SENSITIVE = 1 shl 10
	GTK_CAN_FOCUS = 1 shl 11
	GTK_HAS_FOCUS = 1 shl 12
	GTK_CAN_DEFAULT = 1 shl 13
	GTK_HAS_DEFAULT = 1 shl 14
	GTK_HAS_GRAB = 1 shl 15
	GTK_RC_STYLE = 1 shl 16
	GTK_COMPOSITE_CHILD = 1 shl 17
	GTK_NO_REPARENT = 1 shl 18
	GTK_APP_PAINTABLE = 1 shl 19
	GTK_RECEIVES_DEFAULT = 1 shl 20
	GTK_DOUBLE_BUFFERED = 1 shl 21
	GTK_NO_SHOW_ALL = 1 shl 22
end enum


enum GtkWidgetHelpType
	GTK_WIDGET_HELP_TOOLTIP
	GTK_WIDGET_HELP_WHATS_THIS
end enum

type GtkRequisition as _GtkRequisition
type GtkAllocation as GdkRectangle
type GtkSelectionData as _GtkSelectionData
type GtkWidgetClass as _GtkWidgetClass
type GtkWidgetAuxInfo as _GtkWidgetAuxInfo
type GtkWidgetShapeInfo as _GtkWidgetShapeInfo
type GtkClipboard as _GtkClipboard
type GtkCallback as sub cdecl(byval as GtkWidget ptr, byval as gpointer)

type _GtkRequisition
	width as gint
	height as gint
end type

type _GtkWidget
	object as GtkObject
	private_flags as guint16
	state as guint8
	saved_state as guint8
	name as gchar ptr
	style as GtkStyle ptr
	requisition as GtkRequisition
	allocation as GtkAllocation
	window as GdkWindow ptr
	parent as GtkWidget ptr
end type

type _GtkWidgetClass
	parent_class as GtkObjectClass
	activate_signal as guint
	set_scroll_adjustments_signal as guint
	dispatch_child_properties_changed as sub cdecl(byval as GtkWidget ptr, byval as guint, byval as GParamSpec ptr ptr)
	show as sub cdecl(byval as GtkWidget ptr)
	show_all as sub cdecl(byval as GtkWidget ptr)
	hide as sub cdecl(byval as GtkWidget ptr)
	hide_all as sub cdecl(byval as GtkWidget ptr)
	map as sub cdecl(byval as GtkWidget ptr)
	unmap as sub cdecl(byval as GtkWidget ptr)
	realize as sub cdecl(byval as GtkWidget ptr)
	unrealize as sub cdecl(byval as GtkWidget ptr)
	size_request as sub cdecl(byval as GtkWidget ptr, byval as GtkRequisition ptr)
	size_allocate as sub cdecl(byval as GtkWidget ptr, byval as GtkAllocation ptr)
	state_changed as sub cdecl(byval as GtkWidget ptr, byval as GtkStateType)
	parent_set as sub cdecl(byval as GtkWidget ptr, byval as GtkWidget ptr)
	hierarchy_changed as sub cdecl(byval as GtkWidget ptr, byval as GtkWidget ptr)
	style_set as sub cdecl(byval as GtkWidget ptr, byval as GtkStyle ptr)
	direction_changed as sub cdecl(byval as GtkWidget ptr, byval as GtkTextDirection)
	grab_notify as sub cdecl(byval as GtkWidget ptr, byval as gboolean)
	child_notify as sub cdecl(byval as GtkWidget ptr, byval as GParamSpec ptr)
	mnemonic_activate as function cdecl(byval as GtkWidget ptr, byval as gboolean) as gboolean
	grab_focus as sub cdecl(byval as GtkWidget ptr)
	focus as function cdecl(byval as GtkWidget ptr, byval as GtkDirectionType) as gboolean
	event as function cdecl(byval as GtkWidget ptr, byval as GdkEvent ptr) as gboolean
	button_press_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventButton ptr) as gboolean
	button_release_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventButton ptr) as gboolean
	scroll_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventScroll ptr) as gboolean
	motion_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventMotion ptr) as gboolean
	delete_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventAny ptr) as gboolean
	destroy_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventAny ptr) as gboolean
	expose_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventExpose ptr) as gboolean
	key_press_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventKey ptr) as gboolean
	key_release_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventKey ptr) as gboolean
	enter_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventCrossing ptr) as gboolean
	leave_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventCrossing ptr) as gboolean
	configure_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventConfigure ptr) as gboolean
	focus_in_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventFocus ptr) as gboolean
	focus_out_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventFocus ptr) as gboolean
	map_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventAny ptr) as gboolean
	unmap_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventAny ptr) as gboolean
	property_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventProperty ptr) as gboolean
	selection_clear_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventSelection ptr) as gboolean
	selection_request_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventSelection ptr) as gboolean
	selection_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventSelection ptr) as gboolean
	proximity_in_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventProximity ptr) as gboolean
	proximity_out_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventProximity ptr) as gboolean
	visibility_notify_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventVisibility ptr) as gboolean
	client_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventClient ptr) as gboolean
	no_expose_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventAny ptr) as gboolean
	window_state_event as function cdecl(byval as GtkWidget ptr, byval as GdkEventWindowState ptr) as gboolean
	selection_get as sub cdecl(byval as GtkWidget ptr, byval as GtkSelectionData ptr, byval as guint, byval as guint)
	selection_received as sub cdecl(byval as GtkWidget ptr, byval as GtkSelectionData ptr, byval as guint)
	drag_begin as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr)
	drag_end as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr)
	drag_data_get as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr, byval as GtkSelectionData ptr, byval as guint, byval as guint)
	drag_data_delete as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr)
	drag_leave as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr, byval as guint)
	drag_motion as function cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr, byval as gint, byval as gint, byval as guint) as gboolean
	drag_drop as function cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr, byval as gint, byval as gint, byval as guint) as gboolean
	drag_data_received as sub cdecl(byval as GtkWidget ptr, byval as GdkDragContext ptr, byval as gint, byval as gint, byval as GtkSelectionData ptr, byval as guint, byval as guint)
	popup_menu as function cdecl(byval as GtkWidget ptr) as gboolean
	show_help as function cdecl(byval as GtkWidget ptr, byval as GtkWidgetHelpType) as gboolean
	get_accessible as function cdecl(byval as GtkWidget ptr) as AtkObject ptr
	screen_changed as sub cdecl(byval as GtkWidget ptr, byval as GdkScreen ptr)
	can_activate_accel as function cdecl(byval as GtkWidget ptr, byval as guint) as gboolean
	_gtk_reserved2 as sub cdecl()
	_gtk_reserved3 as sub cdecl()
	_gtk_reserved4 as sub cdecl()
	_gtk_reserved5 as sub cdecl()
	_gtk_reserved6 as sub cdecl()
	_gtk_reserved7 as sub cdecl()
end type

type _GtkWidgetAuxInfo
	x as gint
	y as gint
	width as gint
	height as gint
	x_set as guint
	y_set as guint
end type

type _GtkWidgetShapeInfo
	offset_x as gint16
	offset_y as gint16
	shape_mask as GdkBitmap ptr
end type

declare function gtk_widget_get_type cdecl alias "gtk_widget_get_type" () as GType
declare function gtk_widget_new cdecl alias "gtk_widget_new" (byval type as GType, byval first_property_name as gchar ptr, ...) as GtkWidget ptr
declare function gtk_widget_ref cdecl alias "gtk_widget_ref" (byval widget as GtkWidget ptr) as GtkWidget ptr
declare sub gtk_widget_unref cdecl alias "gtk_widget_unref" (byval widget as GtkWidget ptr)
declare sub gtk_widget_destroy cdecl alias "gtk_widget_destroy" (byval widget as GtkWidget ptr)
declare sub gtk_widget_destroyed cdecl alias "gtk_widget_destroyed" (byval widget as GtkWidget ptr, byval widget_pointer as GtkWidget ptr ptr)
declare sub gtk_widget_set cdecl alias "gtk_widget_set" (byval widget as GtkWidget ptr, byval first_property_name as gchar ptr, ...)
declare sub gtk_widget_unparent cdecl alias "gtk_widget_unparent" (byval widget as GtkWidget ptr)
declare sub gtk_widget_show cdecl alias "gtk_widget_show" (byval widget as GtkWidget ptr)
declare sub gtk_widget_show_now cdecl alias "gtk_widget_show_now" (byval widget as GtkWidget ptr)
declare sub gtk_widget_hide cdecl alias "gtk_widget_hide" (byval widget as GtkWidget ptr)
declare sub gtk_widget_show_all cdecl alias "gtk_widget_show_all" (byval widget as GtkWidget ptr)
declare sub gtk_widget_hide_all cdecl alias "gtk_widget_hide_all" (byval widget as GtkWidget ptr)
declare sub gtk_widget_set_no_show_all cdecl alias "gtk_widget_set_no_show_all" (byval widget as GtkWidget ptr, byval no_show_all as gboolean)
declare function gtk_widget_get_no_show_all cdecl alias "gtk_widget_get_no_show_all" (byval widget as GtkWidget ptr) as gboolean
declare sub gtk_widget_map cdecl alias "gtk_widget_map" (byval widget as GtkWidget ptr)
declare sub gtk_widget_unmap cdecl alias "gtk_widget_unmap" (byval widget as GtkWidget ptr)
declare sub gtk_widget_realize cdecl alias "gtk_widget_realize" (byval widget as GtkWidget ptr)
declare sub gtk_widget_unrealize cdecl alias "gtk_widget_unrealize" (byval widget as GtkWidget ptr)
declare sub gtk_widget_queue_draw cdecl alias "gtk_widget_queue_draw" (byval widget as GtkWidget ptr)
declare sub gtk_widget_queue_draw_area cdecl alias "gtk_widget_queue_draw_area" (byval widget as GtkWidget ptr, byval x as gint, byval y as gint, byval width as gint, byval height as gint)
declare sub gtk_widget_queue_clear cdecl alias "gtk_widget_queue_clear" (byval widget as GtkWidget ptr)
declare sub gtk_widget_queue_clear_area cdecl alias "gtk_widget_queue_clear_area" (byval widget as GtkWidget ptr, byval x as gint, byval y as gint, byval width as gint, byval height as gint)
declare sub gtk_widget_queue_resize cdecl alias "gtk_widget_queue_resize" (byval widget as GtkWidget ptr)
declare sub gtk_widget_queue_resize_no_redraw cdecl alias "gtk_widget_queue_resize_no_redraw" (byval widget as GtkWidget ptr)
declare sub gtk_widget_draw cdecl alias "gtk_widget_draw" (byval widget as GtkWidget ptr, byval area as GdkRectangle ptr)
declare sub gtk_widget_size_request cdecl alias "gtk_widget_size_request" (byval widget as GtkWidget ptr, byval requisition as GtkRequisition ptr)
declare sub gtk_widget_size_allocate cdecl alias "gtk_widget_size_allocate" (byval widget as GtkWidget ptr, byval allocation as GtkAllocation ptr)
declare sub gtk_widget_get_child_requisition cdecl alias "gtk_widget_get_child_requisition" (byval widget as GtkWidget ptr, byval requisition as GtkRequisition ptr)
declare sub gtk_widget_add_accelerator cdecl alias "gtk_widget_add_accelerator" (byval widget as GtkWidget ptr, byval accel_signal as gchar ptr, byval accel_group as GtkAccelGroup ptr, byval accel_key as guint, byval accel_mods as GdkModifierType, byval accel_flags as GtkAccelFlags)
declare function gtk_widget_remove_accelerator cdecl alias "gtk_widget_remove_accelerator" (byval widget as GtkWidget ptr, byval accel_group as GtkAccelGroup ptr, byval accel_key as guint, byval accel_mods as GdkModifierType) as gboolean
declare sub gtk_widget_set_accel_path cdecl alias "gtk_widget_set_accel_path" (byval widget as GtkWidget ptr, byval accel_path as gchar ptr, byval accel_group as GtkAccelGroup ptr)
declare function _gtk_widget_get_accel_path cdecl alias "_gtk_widget_get_accel_path" (byval widget as GtkWidget ptr, byval locked as gboolean ptr) as gchar ptr
declare function gtk_widget_list_accel_closures cdecl alias "gtk_widget_list_accel_closures" (byval widget as GtkWidget ptr) as GList ptr
declare function gtk_widget_can_activate_accel cdecl alias "gtk_widget_can_activate_accel" (byval widget as GtkWidget ptr, byval signal_id as guint) as gboolean
declare function gtk_widget_mnemonic_activate cdecl alias "gtk_widget_mnemonic_activate" (byval widget as GtkWidget ptr, byval group_cycling as gboolean) as gboolean
declare function gtk_widget_event cdecl alias "gtk_widget_event" (byval widget as GtkWidget ptr, byval event as GdkEvent ptr) as gboolean
declare function gtk_widget_send_expose cdecl alias "gtk_widget_send_expose" (byval widget as GtkWidget ptr, byval event as GdkEvent ptr) as gint
declare function gtk_widget_activate cdecl alias "gtk_widget_activate" (byval widget as GtkWidget ptr) as gboolean
declare function gtk_widget_set_scroll_adjustments cdecl alias "gtk_widget_set_scroll_adjustments" (byval widget as GtkWidget ptr, byval hadjustment as GtkAdjustment ptr, byval vadjustment as GtkAdjustment ptr) as gboolean
declare sub gtk_widget_reparent cdecl alias "gtk_widget_reparent" (byval widget as GtkWidget ptr, byval new_parent as GtkWidget ptr)
declare function gtk_widget_intersect cdecl alias "gtk_widget_intersect" (byval widget as GtkWidget ptr, byval area as GdkRectangle ptr, byval intersection as GdkRectangle ptr) as gboolean
declare function gtk_widget_region_intersect cdecl alias "gtk_widget_region_intersect" (byval widget as GtkWidget ptr, byval region as GdkRegion ptr) as GdkRegion ptr
declare sub gtk_widget_freeze_child_notify cdecl alias "gtk_widget_freeze_child_notify" (byval widget as GtkWidget ptr)
declare sub gtk_widget_child_notify cdecl alias "gtk_widget_child_notify" (byval widget as GtkWidget ptr, byval child_property as gchar ptr)
declare sub gtk_widget_thaw_child_notify cdecl alias "gtk_widget_thaw_child_notify" (byval widget as GtkWidget ptr)
declare function gtk_widget_is_focus cdecl alias "gtk_widget_is_focus" (byval widget as GtkWidget ptr) as gboolean
declare sub gtk_widget_grab_focus cdecl alias "gtk_widget_grab_focus" (byval widget as GtkWidget ptr)
declare sub gtk_widget_grab_default cdecl alias "gtk_widget_grab_default" (byval widget as GtkWidget ptr)
declare sub gtk_widget_set_name cdecl alias "gtk_widget_set_name" (byval widget as GtkWidget ptr, byval name as gchar ptr)
declare function gtk_widget_get_name cdecl alias "gtk_widget_get_name" (byval widget as GtkWidget ptr) as gchar ptr
declare sub gtk_widget_set_state cdecl alias "gtk_widget_set_state" (byval widget as GtkWidget ptr, byval state as GtkStateType)
declare sub gtk_widget_set_sensitive cdecl alias "gtk_widget_set_sensitive" (byval widget as GtkWidget ptr, byval sensitive as gboolean)
declare sub gtk_widget_set_app_paintable cdecl alias "gtk_widget_set_app_paintable" (byval widget as GtkWidget ptr, byval app_paintable as gboolean)
declare sub gtk_widget_set_double_buffered cdecl alias "gtk_widget_set_double_buffered" (byval widget as GtkWidget ptr, byval double_buffered as gboolean)
declare sub gtk_widget_set_redraw_on_allocate cdecl alias "gtk_widget_set_redraw_on_allocate" (byval widget as GtkWidget ptr, byval redraw_on_allocate as gboolean)
declare sub gtk_widget_set_parent cdecl alias "gtk_widget_set_parent" (byval widget as GtkWidget ptr, byval parent as GtkWidget ptr)
declare sub gtk_widget_set_parent_window cdecl alias "gtk_widget_set_parent_window" (byval widget as GtkWidget ptr, byval parent_window as GdkWindow ptr)
declare sub gtk_widget_set_child_visible cdecl alias "gtk_widget_set_child_visible" (byval widget as GtkWidget ptr, byval is_visible as gboolean)
declare function gtk_widget_get_child_visible cdecl alias "gtk_widget_get_child_visible" (byval widget as GtkWidget ptr) as gboolean
declare function gtk_widget_get_parent cdecl alias "gtk_widget_get_parent" (byval widget as GtkWidget ptr) as GtkWidget ptr
declare function gtk_widget_get_parent_window cdecl alias "gtk_widget_get_parent_window" (byval widget as GtkWidget ptr) as GdkWindow ptr
declare function gtk_widget_child_focus cdecl alias "gtk_widget_child_focus" (byval widget as GtkWidget ptr, byval direction as GtkDirectionType) as gboolean
declare sub gtk_widget_set_size_request cdecl alias "gtk_widget_set_size_request" (byval widget as GtkWidget ptr, byval width as gint, byval height as gint)
declare sub gtk_widget_get_size_request cdecl alias "gtk_widget_get_size_request" (byval widget as GtkWidget ptr, byval width as gint ptr, byval height as gint ptr)
declare sub gtk_widget_set_uposition cdecl alias "gtk_widget_set_uposition" (byval widget as GtkWidget ptr, byval x as gint, byval y as gint)
declare sub gtk_widget_set_usize cdecl alias "gtk_widget_set_usize" (byval widget as GtkWidget ptr, byval width as gint, byval height as gint)
declare sub gtk_widget_set_events cdecl alias "gtk_widget_set_events" (byval widget as GtkWidget ptr, byval events as gint)
declare sub gtk_widget_add_events cdecl alias "gtk_widget_add_events" (byval widget as GtkWidget ptr, byval events as gint)
declare sub gtk_widget_set_extension_events cdecl alias "gtk_widget_set_extension_events" (byval widget as GtkWidget ptr, byval mode as GdkExtensionMode)
declare function gtk_widget_get_extension_events cdecl alias "gtk_widget_get_extension_events" (byval widget as GtkWidget ptr) as GdkExtensionMode
declare function gtk_widget_get_toplevel cdecl alias "gtk_widget_get_toplevel" (byval widget as GtkWidget ptr) as GtkWidget ptr
declare function gtk_widget_get_ancestor cdecl alias "gtk_widget_get_ancestor" (byval widget as GtkWidget ptr, byval widget_type as GType) as GtkWidget ptr
declare function gtk_widget_get_colormap cdecl alias "gtk_widget_get_colormap" (byval widget as GtkWidget ptr) as GdkColormap ptr
declare function gtk_widget_get_visual cdecl alias "gtk_widget_get_visual" (byval widget as GtkWidget ptr) as GdkVisual ptr
declare function gtk_widget_get_screen cdecl alias "gtk_widget_get_screen" (byval widget as GtkWidget ptr) as GdkScreen ptr
declare function gtk_widget_has_screen cdecl alias "gtk_widget_has_screen" (byval widget as GtkWidget ptr) as gboolean
declare function gtk_widget_get_display cdecl alias "gtk_widget_get_display" (byval widget as GtkWidget ptr) as GdkDisplay ptr
declare function gtk_widget_get_root_window cdecl alias "gtk_widget_get_root_window" (byval widget as GtkWidget ptr) as GdkWindow ptr
declare function gtk_widget_get_settings cdecl alias "gtk_widget_get_settings" (byval widget as GtkWidget ptr) as GtkSettings ptr
declare function gtk_widget_get_clipboard cdecl alias "gtk_widget_get_clipboard" (byval widget as GtkWidget ptr, byval selection as GdkAtom) as GtkClipboard ptr
declare function gtk_widget_get_accessible cdecl alias "gtk_widget_get_accessible" (byval widget as GtkWidget ptr) as AtkObject ptr
declare sub gtk_widget_set_colormap cdecl alias "gtk_widget_set_colormap" (byval widget as GtkWidget ptr, byval colormap as GdkColormap ptr)
declare function gtk_widget_get_events cdecl alias "gtk_widget_get_events" (byval widget as GtkWidget ptr) as gint
declare sub gtk_widget_get_pointer cdecl alias "gtk_widget_get_pointer" (byval widget as GtkWidget ptr, byval x as gint ptr, byval y as gint ptr)
declare function gtk_widget_is_ancestor cdecl alias "gtk_widget_is_ancestor" (byval widget as GtkWidget ptr, byval ancestor as GtkWidget ptr) as gboolean
declare function gtk_widget_translate_coordinates cdecl alias "gtk_widget_translate_coordinates" (byval src_widget as GtkWidget ptr, byval dest_widget as GtkWidget ptr, byval src_x as gint, byval src_y as gint, byval dest_x as gint ptr, byval dest_y as gint ptr) as gboolean
declare function gtk_widget_hide_on_delete cdecl alias "gtk_widget_hide_on_delete" (byval widget as GtkWidget ptr) as gboolean
declare sub gtk_widget_set_style cdecl alias "gtk_widget_set_style" (byval widget as GtkWidget ptr, byval style as GtkStyle ptr)
declare sub gtk_widget_ensure_style cdecl alias "gtk_widget_ensure_style" (byval widget as GtkWidget ptr)
declare function gtk_widget_get_style cdecl alias "gtk_widget_get_style" (byval widget as GtkWidget ptr) as GtkStyle ptr
declare sub gtk_widget_modify_style cdecl alias "gtk_widget_modify_style" (byval widget as GtkWidget ptr, byval style as GtkRcStyle ptr)
declare function gtk_widget_get_modifier_style cdecl alias "gtk_widget_get_modifier_style" (byval widget as GtkWidget ptr) as GtkRcStyle ptr
declare sub gtk_widget_modify_fg cdecl alias "gtk_widget_modify_fg" (byval widget as GtkWidget ptr, byval state as GtkStateType, byval color as GdkColor ptr)
declare sub gtk_widget_modify_bg cdecl alias "gtk_widget_modify_bg" (byval widget as GtkWidget ptr, byval state as GtkStateType, byval color as GdkColor ptr)
declare sub gtk_widget_modify_text cdecl alias "gtk_widget_modify_text" (byval widget as GtkWidget ptr, byval state as GtkStateType, byval color as GdkColor ptr)
declare sub gtk_widget_modify_base cdecl alias "gtk_widget_modify_base" (byval widget as GtkWidget ptr, byval state as GtkStateType, byval color as GdkColor ptr)
declare sub gtk_widget_modify_font cdecl alias "gtk_widget_modify_font" (byval widget as GtkWidget ptr, byval font_desc as PangoFontDescription ptr)
declare function gtk_widget_create_pango_context cdecl alias "gtk_widget_create_pango_context" (byval widget as GtkWidget ptr) as PangoContext ptr
declare function gtk_widget_get_pango_context cdecl alias "gtk_widget_get_pango_context" (byval widget as GtkWidget ptr) as PangoContext ptr
declare function gtk_widget_create_pango_layout cdecl alias "gtk_widget_create_pango_layout" (byval widget as GtkWidget ptr, byval text as gchar ptr) as PangoLayout ptr
declare function gtk_widget_render_icon cdecl alias "gtk_widget_render_icon" (byval widget as GtkWidget ptr, byval stock_id as gchar ptr, byval size as GtkIconSize, byval detail as gchar ptr) as GdkPixbuf ptr
declare sub gtk_widget_set_composite_name cdecl alias "gtk_widget_set_composite_name" (byval widget as GtkWidget ptr, byval name as gchar ptr)
declare function gtk_widget_get_composite_name cdecl alias "gtk_widget_get_composite_name" (byval widget as GtkWidget ptr) as gchar ptr
declare sub gtk_widget_reset_rc_styles cdecl alias "gtk_widget_reset_rc_styles" (byval widget as GtkWidget ptr)
declare sub gtk_widget_push_colormap cdecl alias "gtk_widget_push_colormap" (byval cmap as GdkColormap ptr)
declare sub gtk_widget_push_composite_child cdecl alias "gtk_widget_push_composite_child" ()
declare sub gtk_widget_pop_composite_child cdecl alias "gtk_widget_pop_composite_child" ()
declare sub gtk_widget_pop_colormap cdecl alias "gtk_widget_pop_colormap" ()
declare sub gtk_widget_class_install_style_property cdecl alias "gtk_widget_class_install_style_property" (byval klass as GtkWidgetClass ptr, byval pspec as GParamSpec ptr)
declare sub gtk_widget_class_install_style_property_parser cdecl alias "gtk_widget_class_install_style_property_parser" (byval klass as GtkWidgetClass ptr, byval pspec as GParamSpec ptr, byval parser as GtkRcPropertyParser)
declare function gtk_widget_class_find_style_property cdecl alias "gtk_widget_class_find_style_property" (byval klass as GtkWidgetClass ptr, byval property_name as gchar ptr) as GParamSpec ptr
declare function gtk_widget_class_list_style_properties cdecl alias "gtk_widget_class_list_style_properties" (byval klass as GtkWidgetClass ptr, byval n_properties as guint ptr) as GParamSpec ptr ptr
declare sub gtk_widget_style_get_property cdecl alias "gtk_widget_style_get_property" (byval widget as GtkWidget ptr, byval property_name as gchar ptr, byval value as GValue ptr)
''''''' declare sub gtk_widget_style_get_valist cdecl alias "gtk_widget_style_get_valist" (byval widget as GtkWidget ptr, byval first_property_name as gchar ptr, byval var_args as va_list)
declare sub gtk_widget_style_get cdecl alias "gtk_widget_style_get" (byval widget as GtkWidget ptr, byval first_property_name as gchar ptr, ...)
declare sub gtk_widget_set_default_colormap cdecl alias "gtk_widget_set_default_colormap" (byval colormap as GdkColormap ptr)
declare function gtk_widget_get_default_style cdecl alias "gtk_widget_get_default_style" () as GtkStyle ptr
declare function gtk_widget_get_default_colormap cdecl alias "gtk_widget_get_default_colormap" () as GdkColormap ptr
declare function gtk_widget_get_default_visual cdecl alias "gtk_widget_get_default_visual" () as GdkVisual ptr
declare sub gtk_widget_set_direction cdecl alias "gtk_widget_set_direction" (byval widget as GtkWidget ptr, byval dir as GtkTextDirection)
declare function gtk_widget_get_direction cdecl alias "gtk_widget_get_direction" (byval widget as GtkWidget ptr) as GtkTextDirection
declare sub gtk_widget_set_default_direction cdecl alias "gtk_widget_set_default_direction" (byval dir as GtkTextDirection)
declare function gtk_widget_get_default_direction cdecl alias "gtk_widget_get_default_direction" () as GtkTextDirection
declare sub gtk_widget_shape_combine_mask cdecl alias "gtk_widget_shape_combine_mask" (byval widget as GtkWidget ptr, byval shape_mask as GdkBitmap ptr, byval offset_x as gint, byval offset_y as gint)
declare sub gtk_widget_reset_shapes cdecl alias "gtk_widget_reset_shapes" (byval widget as GtkWidget ptr)
declare sub gtk_widget_path cdecl alias "gtk_widget_path" (byval widget as GtkWidget ptr, byval path_length as guint ptr, byval path as gchar ptr ptr, byval path_reversed as gchar ptr ptr)
declare sub gtk_widget_class_path cdecl alias "gtk_widget_class_path" (byval widget as GtkWidget ptr, byval path_length as guint ptr, byval path as gchar ptr ptr, byval path_reversed as gchar ptr ptr)
declare function gtk_widget_list_mnemonic_labels cdecl alias "gtk_widget_list_mnemonic_labels" (byval widget as GtkWidget ptr) as GList ptr
declare sub gtk_widget_add_mnemonic_label cdecl alias "gtk_widget_add_mnemonic_label" (byval widget as GtkWidget ptr, byval label as GtkWidget ptr)
declare sub gtk_widget_remove_mnemonic_label cdecl alias "gtk_widget_remove_mnemonic_label" (byval widget as GtkWidget ptr, byval label as GtkWidget ptr)
declare function gtk_requisition_get_type cdecl alias "gtk_requisition_get_type" () as GType
declare function gtk_requisition_copy cdecl alias "gtk_requisition_copy" (byval requisition as GtkRequisition ptr) as GtkRequisition ptr
declare sub gtk_requisition_free cdecl alias "gtk_requisition_free" (byval requisition as GtkRequisition ptr)
declare sub _gtk_widget_grab_notify cdecl alias "_gtk_widget_grab_notify" (byval widget as GtkWidget ptr, byval was_grabbed as gboolean)
declare function _gtk_widget_get_aux_info cdecl alias "_gtk_widget_get_aux_info" (byval widget as GtkWidget ptr, byval create as gboolean) as GtkWidgetAuxInfo ptr
declare sub _gtk_widget_propagate_hierarchy_changed cdecl alias "_gtk_widget_propagate_hierarchy_changed" (byval widget as GtkWidget ptr, byval previous_toplevel as GtkWidget ptr)
declare sub _gtk_widget_propagate_screen_changed cdecl alias "_gtk_widget_propagate_screen_changed" (byval widget as GtkWidget ptr, byval previous_screen as GdkScreen ptr)
declare function _gtk_widget_peek_colormap cdecl alias "_gtk_widget_peek_colormap" () as GdkColormap ptr

#endif
