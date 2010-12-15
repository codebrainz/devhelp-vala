<?xml version="1.0"?>
<api version="1.0">
	<namespace name="Dh">
		<function name="error_quark" symbol="dh_error_quark">
			<return-type type="GQuark"/>
		</function>
		<struct name="DhKeywordModelPriv">
		</struct>
		<struct name="DhWindowPriv">
		</struct>
		<boxed name="DhLink" type-name="DhLink" get-type="dh_link_get_type">
			<method name="compare" symbol="dh_link_compare">
				<return-type type="gint"/>
				<parameters>
					<parameter name="a" type="gconstpointer"/>
					<parameter name="b" type="gconstpointer"/>
				</parameters>
			</method>
			<method name="free" symbol="dh_link_free">
				<return-type type="void"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_book_id" symbol="dh_link_get_book_id">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_book_name" symbol="dh_link_get_book_name">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_file_name" symbol="dh_link_get_file_name">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_flags" symbol="dh_link_get_flags">
				<return-type type="DhLinkFlags"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_link_type" symbol="dh_link_get_link_type">
				<return-type type="DhLinkType"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_name" symbol="dh_link_get_name">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_page_name" symbol="dh_link_get_page_name">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_type_as_string" symbol="dh_link_get_type_as_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="get_uri" symbol="dh_link_get_uri">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_link_new">
				<return-type type="DhLink*"/>
				<parameters>
					<parameter name="type" type="DhLinkType"/>
					<parameter name="base" type="gchar*"/>
					<parameter name="id" type="gchar*"/>
					<parameter name="name" type="gchar*"/>
					<parameter name="book" type="DhLink*"/>
					<parameter name="page" type="DhLink*"/>
					<parameter name="filename" type="gchar*"/>
				</parameters>
			</constructor>
			<method name="ref" symbol="dh_link_ref">
				<return-type type="DhLink*"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
			<method name="set_flags" symbol="dh_link_set_flags">
				<return-type type="void"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
					<parameter name="flags" type="DhLinkFlags"/>
				</parameters>
			</method>
			<method name="unref" symbol="dh_link_unref">
				<return-type type="void"/>
				<parameters>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
		</boxed>
		<enum name="DhError">
			<member name="DH_ERROR_FILE_NOT_FOUND" value="0"/>
			<member name="DH_ERROR_MALFORMED_BOOK" value="1"/>
			<member name="DH_ERROR_INVALID_BOOK_TYPE" value="2"/>
			<member name="DH_ERROR_INTERNAL_ERROR" value="3"/>
		</enum>
		<enum name="DhLinkFlags">
			<member name="DH_LINK_FLAGS_NONE" value="0"/>
			<member name="DH_LINK_FLAGS_DEPRECATED" value="1"/>
		</enum>
		<enum name="DhLinkType">
			<member name="DH_LINK_TYPE_BOOK" value="0"/>
			<member name="DH_LINK_TYPE_PAGE" value="1"/>
			<member name="DH_LINK_TYPE_KEYWORD" value="2"/>
			<member name="DH_LINK_TYPE_FUNCTION" value="3"/>
			<member name="DH_LINK_TYPE_STRUCT" value="4"/>
			<member name="DH_LINK_TYPE_MACRO" value="5"/>
			<member name="DH_LINK_TYPE_ENUM" value="6"/>
			<member name="DH_LINK_TYPE_TYPEDEF" value="7"/>
		</enum>
		<enum name="DhOpenLinkFlags">
			<member name="DH_OPEN_LINK_NEW_WINDOW" value="1"/>
			<member name="DH_OPEN_LINK_NEW_TAB" value="2"/>
		</enum>
		<object name="DhAssistant" parent="GtkWindow" type-name="DhAssistant" get-type="dh_assistant_get_type">
			<implements>
				<interface name="AtkImplementor"/>
				<interface name="GtkBuildable"/>
			</implements>
			<constructor name="new" symbol="dh_assistant_new">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</constructor>
			<method name="search" symbol="dh_assistant_search">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="assistant" type="DhAssistant*"/>
					<parameter name="str" type="gchar*"/>
				</parameters>
			</method>
		</object>
		<object name="DhAssistantView" parent="WebKitWebView" type-name="DhAssistantView" get-type="dh_assistant_view_get_type">
			<implements>
				<interface name="AtkImplementor"/>
				<interface name="GtkBuildable"/>
			</implements>
			<method name="get_base" symbol="dh_assistant_view_get_base">
				<return-type type="DhBase*"/>
				<parameters>
					<parameter name="view" type="DhAssistantView*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_assistant_view_new">
				<return-type type="GtkWidget*"/>
			</constructor>
			<method name="search" symbol="dh_assistant_view_search">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="view" type="DhAssistantView*"/>
					<parameter name="str" type="gchar*"/>
				</parameters>
			</method>
			<method name="set_base" symbol="dh_assistant_view_set_base">
				<return-type type="void"/>
				<parameters>
					<parameter name="view" type="DhAssistantView*"/>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</method>
			<method name="set_link" symbol="dh_assistant_view_set_link">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="view" type="DhAssistantView*"/>
					<parameter name="link" type="DhLink*"/>
				</parameters>
			</method>
		</object>
		<object name="DhBase" parent="GObject" type-name="DhBase" get-type="dh_base_get_type">
			<method name="get" symbol="dh_base_get">
				<return-type type="DhBase*"/>
			</method>
			<method name="get_book_manager" symbol="dh_base_get_book_manager">
				<return-type type="DhBookManager*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</method>
			<method name="get_window" symbol="dh_base_get_window">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</method>
			<method name="get_window_on_current_workspace" symbol="dh_base_get_window_on_current_workspace">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_base_new">
				<return-type type="DhBase*"/>
			</constructor>
			<constructor name="new_assistant" symbol="dh_base_new_assistant">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</constructor>
			<constructor name="new_window" symbol="dh_base_new_window">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</constructor>
			<method name="quit" symbol="dh_base_quit">
				<return-type type="void"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</method>
		</object>
		<object name="DhBook" parent="GObject" type-name="DhBook" get-type="dh_book_get_type">
			<method name="cmp_by_name" symbol="dh_book_cmp_by_name">
				<return-type type="gint"/>
				<parameters>
					<parameter name="a" type="DhBook*"/>
					<parameter name="b" type="DhBook*"/>
				</parameters>
			</method>
			<method name="cmp_by_path" symbol="dh_book_cmp_by_path">
				<return-type type="gint"/>
				<parameters>
					<parameter name="a" type="DhBook*"/>
					<parameter name="b" type="DhBook*"/>
				</parameters>
			</method>
			<method name="cmp_by_title" symbol="dh_book_cmp_by_title">
				<return-type type="gint"/>
				<parameters>
					<parameter name="a" type="DhBook*"/>
					<parameter name="b" type="DhBook*"/>
				</parameters>
			</method>
			<method name="get_enabled" symbol="dh_book_get_enabled">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
				</parameters>
			</method>
			<method name="get_keywords" symbol="dh_book_get_keywords">
				<return-type type="GList*"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
				</parameters>
			</method>
			<method name="get_name" symbol="dh_book_get_name">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
				</parameters>
			</method>
			<method name="get_title" symbol="dh_book_get_title">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
				</parameters>
			</method>
			<method name="get_tree" symbol="dh_book_get_tree">
				<return-type type="GNode*"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_book_new">
				<return-type type="DhBook*"/>
				<parameters>
					<parameter name="book_path" type="gchar*"/>
				</parameters>
			</constructor>
			<method name="set_enabled" symbol="dh_book_set_enabled">
				<return-type type="void"/>
				<parameters>
					<parameter name="book" type="DhBook*"/>
					<parameter name="enabled" type="gboolean"/>
				</parameters>
			</method>
		</object>
		<object name="DhBookManager" parent="GObject" type-name="DhBookManager" get-type="dh_book_manager_get_type">
			<method name="get_book_by_name" symbol="dh_book_manager_get_book_by_name">
				<return-type type="DhBook*"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
					<parameter name="name" type="gchar*"/>
				</parameters>
			</method>
			<method name="get_books" symbol="dh_book_manager_get_books">
				<return-type type="GList*"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_book_manager_new">
				<return-type type="DhBookManager*"/>
			</constructor>
			<method name="populate" symbol="dh_book_manager_populate">
				<return-type type="void"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</method>
			<method name="update" symbol="dh_book_manager_update">
				<return-type type="void"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</method>
			<signal name="disabled-book-list-updated" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</signal>
		</object>
		<object name="DhBookTree" parent="GtkTreeView" type-name="DhBookTree" get-type="dh_book_tree_get_type">
			<implements>
				<interface name="AtkImplementor"/>
				<interface name="GtkBuildable"/>
			</implements>
			<method name="get_selected_book_title" symbol="dh_book_tree_get_selected_book_title">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="tree" type="DhBookTree*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_book_tree_new">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</constructor>
			<method name="select_uri" symbol="dh_book_tree_select_uri">
				<return-type type="void"/>
				<parameters>
					<parameter name="book_tree" type="DhBookTree*"/>
					<parameter name="uri" type="gchar*"/>
				</parameters>
			</method>
			<signal name="link-selected" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="object" type="DhBookTree*"/>
					<parameter name="p0" type="gpointer"/>
				</parameters>
			</signal>
		</object>
		<object name="DhKeywordModel" parent="GObject" type-name="DhKeywordModel" get-type="dh_keyword_model_get_type">
			<implements>
				<interface name="GtkTreeModel"/>
			</implements>
			<method name="filter" symbol="dh_keyword_model_filter">
				<return-type type="DhLink*"/>
				<parameters>
					<parameter name="model" type="DhKeywordModel*"/>
					<parameter name="string" type="gchar*"/>
					<parameter name="book_id" type="gchar*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_keyword_model_new">
				<return-type type="DhKeywordModel*"/>
			</constructor>
			<method name="set_words" symbol="dh_keyword_model_set_words">
				<return-type type="void"/>
				<parameters>
					<parameter name="model" type="DhKeywordModel*"/>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</method>
		</object>
		<object name="DhSearch" parent="GtkVBox" type-name="DhSearch" get-type="dh_search_get_type">
			<implements>
				<interface name="AtkImplementor"/>
				<interface name="GtkBuildable"/>
				<interface name="GtkOrientable"/>
			</implements>
			<constructor name="new" symbol="dh_search_new">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="book_manager" type="DhBookManager*"/>
				</parameters>
			</constructor>
			<method name="set_search_string" symbol="dh_search_set_search_string">
				<return-type type="void"/>
				<parameters>
					<parameter name="search" type="DhSearch*"/>
					<parameter name="str" type="gchar*"/>
					<parameter name="book_id" type="gchar*"/>
				</parameters>
			</method>
			<signal name="link-selected" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="search" type="DhSearch*"/>
					<parameter name="link" type="gpointer"/>
				</parameters>
			</signal>
		</object>
		<object name="DhWindow" parent="GtkWindow" type-name="DhWindow" get-type="dh_window_get_type">
			<implements>
				<interface name="AtkImplementor"/>
				<interface name="GtkBuildable"/>
			</implements>
			<method name="focus_search" symbol="dh_window_focus_search">
				<return-type type="void"/>
				<parameters>
					<parameter name="window" type="DhWindow*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="dh_window_new">
				<return-type type="GtkWidget*"/>
				<parameters>
					<parameter name="base" type="DhBase*"/>
				</parameters>
			</constructor>
			<method name="search" symbol="dh_window_search">
				<return-type type="void"/>
				<parameters>
					<parameter name="window" type="DhWindow*"/>
					<parameter name="str" type="gchar*"/>
					<parameter name="book_id" type="gchar*"/>
				</parameters>
			</method>
			<signal name="open-link" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="window" type="DhWindow*"/>
					<parameter name="location" type="char*"/>
					<parameter name="flags" type="DhOpenLinkFlags"/>
				</parameters>
			</signal>
		</object>
	</namespace>
</api>
