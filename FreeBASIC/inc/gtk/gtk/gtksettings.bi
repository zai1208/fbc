''
''
'' gtksettings -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __gtksettings_bi__
#define __gtksettings_bi__

#include once "gtk/gtk/gtkrc.bi"

type GtkSettingsClass as _GtkSettingsClass
type GtkSettingsValue as _GtkSettingsValue
type GtkSettingsPropertyValue as _GtkSettingsPropertyValue

type _GtkSettings
	parent_instance as GObject
	queued_settings as GData ptr
	property_values as GtkSettingsPropertyValue ptr
	rc_context as GtkRcContext ptr
	screen as GdkScreen ptr
end type

type _GtkSettingsClass
	parent_class as GObjectClass
end type

type _GtkSettingsValue
	origin as gchar ptr
	value as GValue
end type

declare function gtk_settings_get_type cdecl alias "gtk_settings_get_type" () as GType
declare function gtk_settings_get_default cdecl alias "gtk_settings_get_default" () as GtkSettings ptr
declare function gtk_settings_get_for_screen cdecl alias "gtk_settings_get_for_screen" (byval screen as GdkScreen ptr) as GtkSettings ptr
declare sub gtk_settings_install_property cdecl alias "gtk_settings_install_property" (byval pspec as GParamSpec ptr)
declare sub gtk_settings_install_property_parser cdecl alias "gtk_settings_install_property_parser" (byval pspec as GParamSpec ptr, byval parser as GtkRcPropertyParser)
declare function gtk_rc_property_parse_color cdecl alias "gtk_rc_property_parse_color" (byval pspec as GParamSpec ptr, byval gstring as GString ptr, byval property_value as GValue ptr) as gboolean
declare function gtk_rc_property_parse_enum cdecl alias "gtk_rc_property_parse_enum" (byval pspec as GParamSpec ptr, byval gstring as GString ptr, byval property_value as GValue ptr) as gboolean
declare function gtk_rc_property_parse_flags cdecl alias "gtk_rc_property_parse_flags" (byval pspec as GParamSpec ptr, byval gstring as GString ptr, byval property_value as GValue ptr) as gboolean
declare function gtk_rc_property_parse_requisition cdecl alias "gtk_rc_property_parse_requisition" (byval pspec as GParamSpec ptr, byval gstring as GString ptr, byval property_value as GValue ptr) as gboolean
declare function gtk_rc_property_parse_border cdecl alias "gtk_rc_property_parse_border" (byval pspec as GParamSpec ptr, byval gstring as GString ptr, byval property_value as GValue ptr) as gboolean
declare sub gtk_settings_set_property_value cdecl alias "gtk_settings_set_property_value" (byval settings as GtkSettings ptr, byval name as gchar ptr, byval svalue as GtkSettingsValue ptr)
declare sub gtk_settings_set_string_property cdecl alias "gtk_settings_set_string_property" (byval settings as GtkSettings ptr, byval name as gchar ptr, byval v_string as gchar ptr, byval origin as gchar ptr)
declare sub gtk_settings_set_long_property cdecl alias "gtk_settings_set_long_property" (byval settings as GtkSettings ptr, byval name as gchar ptr, byval v_long as glong, byval origin as gchar ptr)
declare sub gtk_settings_set_double_property cdecl alias "gtk_settings_set_double_property" (byval settings as GtkSettings ptr, byval name as gchar ptr, byval v_double as gdouble, byval origin as gchar ptr)
declare sub _gtk_settings_set_property_value_from_rc cdecl alias "_gtk_settings_set_property_value_from_rc" (byval settings as GtkSettings ptr, byval name as gchar ptr, byval svalue as GtkSettingsValue ptr)
declare sub _gtk_settings_reset_rc_values cdecl alias "_gtk_settings_reset_rc_values" (byval settings as GtkSettings ptr)
declare sub _gtk_settings_handle_event cdecl alias "_gtk_settings_handle_event" (byval event as GdkEventSetting ptr)
declare function _gtk_rc_property_parser_from_type cdecl alias "_gtk_rc_property_parser_from_type" (byval type as GType) as GtkRcPropertyParser
declare function _gtk_settings_parse_convert cdecl alias "_gtk_settings_parse_convert" (byval parser as GtkRcPropertyParser, byval src_value as GValue ptr, byval pspec as GParamSpec ptr, byval dest_value as GValue ptr) as gboolean

#endif
