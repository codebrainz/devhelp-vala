/* example.c generated by valac 0.10.1, the Vala compiler
 * generated from example.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>
#include <webkit/webkit.h>
#include <devhelp/dh-base.h>
#include <devhelp/dh-book-tree.h>
#include <devhelp/dh-search.h>
#include <devhelp/dh-link.h>
#include <stdlib.h>
#include <string.h>
#include <devhelp/dh-book-manager.h>


#define TYPE_DEVHELP_VIEW_FRAME (devhelp_view_frame_get_type ())
#define DEVHELP_VIEW_FRAME(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_DEVHELP_VIEW_FRAME, DevhelpViewFrame))
#define DEVHELP_VIEW_FRAME_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_DEVHELP_VIEW_FRAME, DevhelpViewFrameClass))
#define IS_DEVHELP_VIEW_FRAME(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_DEVHELP_VIEW_FRAME))
#define IS_DEVHELP_VIEW_FRAME_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_DEVHELP_VIEW_FRAME))
#define DEVHELP_VIEW_FRAME_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_DEVHELP_VIEW_FRAME, DevhelpViewFrameClass))

typedef struct _DevhelpViewFrame DevhelpViewFrame;
typedef struct _DevhelpViewFrameClass DevhelpViewFrameClass;
typedef struct _DevhelpViewFramePrivate DevhelpViewFramePrivate;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))

#define TYPE_DEVHELP_SIDEBAR (devhelp_sidebar_get_type ())
#define DEVHELP_SIDEBAR(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_DEVHELP_SIDEBAR, DevhelpSidebar))
#define DEVHELP_SIDEBAR_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_DEVHELP_SIDEBAR, DevhelpSidebarClass))
#define IS_DEVHELP_SIDEBAR(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_DEVHELP_SIDEBAR))
#define IS_DEVHELP_SIDEBAR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_DEVHELP_SIDEBAR))
#define DEVHELP_SIDEBAR_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_DEVHELP_SIDEBAR, DevhelpSidebarClass))

typedef struct _DevhelpSidebar DevhelpSidebar;
typedef struct _DevhelpSidebarClass DevhelpSidebarClass;
typedef struct _DevhelpSidebarPrivate DevhelpSidebarPrivate;
#define _g_free0(var) (var = (g_free (var), NULL))
#define _dh_link_unref0(var) ((var == NULL) ? NULL : (var = (dh_link_unref (var), NULL)))

struct _DevhelpViewFrame {
	GtkFrame parent_instance;
	DevhelpViewFramePrivate * priv;
	WebKitWebView* dh_view;
};

struct _DevhelpViewFrameClass {
	GtkFrameClass parent_class;
};

struct _DevhelpSidebar {
	GtkNotebook parent_instance;
	DevhelpSidebarPrivate * priv;
	DhBase* dh_base;
	DhBookTree* dh_book_tree;
	DhSearch* dh_search;
	DevhelpViewFrame* dh_frame;
};

struct _DevhelpSidebarClass {
	GtkNotebookClass parent_class;
};


static gpointer devhelp_view_frame_parent_class = NULL;
static gpointer devhelp_sidebar_parent_class = NULL;

GType devhelp_view_frame_get_type (void) G_GNUC_CONST;
enum  {
	DEVHELP_VIEW_FRAME_DUMMY_PROPERTY
};
DevhelpViewFrame* devhelp_view_frame_new (void);
DevhelpViewFrame* devhelp_view_frame_construct (GType object_type);
static void devhelp_view_frame_finalize (GObject* obj);
GType devhelp_sidebar_get_type (void) G_GNUC_CONST;
enum  {
	DEVHELP_SIDEBAR_DUMMY_PROPERTY
};
void devhelp_sidebar_on_link_selected (DevhelpSidebar* self, void* p);
DevhelpSidebar* devhelp_sidebar_new (DevhelpViewFrame* frame);
DevhelpSidebar* devhelp_sidebar_construct (GType object_type, DevhelpViewFrame* frame);
static void _devhelp_sidebar_on_link_selected_dh_book_tree_link_selected (DhBookTree* _sender, void* p0, gpointer self);
static void _devhelp_sidebar_on_link_selected_dh_search_link_selected (DhSearch* _sender, void* link, gpointer self);
static void devhelp_sidebar_finalize (GObject* obj);
gint _vala_main (char** args, int args_length1);
static void _gtk_main_quit_gtk_object_destroy (GtkObject* _sender, gpointer self);



DevhelpViewFrame* devhelp_view_frame_construct (GType object_type) {
	DevhelpViewFrame * self;
	WebKitWebView* _tmp0_;
	GtkScrolledWindow* swview;
	self = g_object_newv (object_type, 0, NULL);
	gtk_frame_set_shadow_type ((GtkFrame*) self, GTK_SHADOW_NONE);
	self->dh_view = (_tmp0_ = g_object_ref_sink ((WebKitWebView*) webkit_web_view_new ()), _g_object_unref0 (self->dh_view), _tmp0_);
	swview = g_object_ref_sink ((GtkScrolledWindow*) gtk_scrolled_window_new (NULL, NULL));
	gtk_scrolled_window_set_policy (swview, GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
	gtk_container_add ((GtkContainer*) swview, (GtkWidget*) self->dh_view);
	gtk_container_add ((GtkContainer*) self, (GtkWidget*) swview);
	webkit_web_view_open (self->dh_view, "about:blank");
	gtk_widget_show_all ((GtkWidget*) self);
	_g_object_unref0 (swview);
	return self;
}


DevhelpViewFrame* devhelp_view_frame_new (void) {
	return devhelp_view_frame_construct (TYPE_DEVHELP_VIEW_FRAME);
}


static void devhelp_view_frame_class_init (DevhelpViewFrameClass * klass) {
	devhelp_view_frame_parent_class = g_type_class_peek_parent (klass);
	G_OBJECT_CLASS (klass)->finalize = devhelp_view_frame_finalize;
}


static void devhelp_view_frame_instance_init (DevhelpViewFrame * self) {
}


static void devhelp_view_frame_finalize (GObject* obj) {
	DevhelpViewFrame * self;
	self = DEVHELP_VIEW_FRAME (obj);
	_g_object_unref0 (self->dh_view);
	G_OBJECT_CLASS (devhelp_view_frame_parent_class)->finalize (obj);
}


GType devhelp_view_frame_get_type (void) {
	static volatile gsize devhelp_view_frame_type_id__volatile = 0;
	if (g_once_init_enter (&devhelp_view_frame_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (DevhelpViewFrameClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) devhelp_view_frame_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (DevhelpViewFrame), 0, (GInstanceInitFunc) devhelp_view_frame_instance_init, NULL };
		GType devhelp_view_frame_type_id;
		devhelp_view_frame_type_id = g_type_register_static (GTK_TYPE_FRAME, "DevhelpViewFrame", &g_define_type_info, 0);
		g_once_init_leave (&devhelp_view_frame_type_id__volatile, devhelp_view_frame_type_id);
	}
	return devhelp_view_frame_type_id__volatile;
}


static gpointer _dh_link_ref0 (gpointer self) {
	return self ? dh_link_ref (self) : NULL;
}


void devhelp_sidebar_on_link_selected (DevhelpSidebar* self, void* p) {
	DhLink* link;
	char* uri;
	g_return_if_fail (self != NULL);
	link = _dh_link_ref0 ((DhLink*) p);
	uri = g_strdup (dh_link_get_uri (link));
	webkit_web_view_open (self->dh_frame->dh_view, uri);
	_g_free0 (uri);
	_dh_link_unref0 (link);
}


static gpointer _g_object_ref0 (gpointer self) {
	return self ? g_object_ref (self) : NULL;
}


static void _devhelp_sidebar_on_link_selected_dh_book_tree_link_selected (DhBookTree* _sender, void* p0, gpointer self) {
	devhelp_sidebar_on_link_selected (self, p0);
}


static void _devhelp_sidebar_on_link_selected_dh_search_link_selected (DhSearch* _sender, void* link, gpointer self) {
	devhelp_sidebar_on_link_selected (self, link);
}


DevhelpSidebar* devhelp_sidebar_construct (GType object_type, DevhelpViewFrame* frame) {
	DevhelpSidebar * self;
	DhBase* _tmp0_;
	DevhelpViewFrame* _tmp1_;
	DhBookManager* book_manager;
	DhBookTree* _tmp2_;
	DhSearch* _tmp3_;
	GtkScrolledWindow* swbooktree;
	GtkFrame* frasearch;
	GtkLabel* _tmp4_;
	GtkLabel* _tmp5_;
	g_return_val_if_fail (frame != NULL, NULL);
	self = g_object_newv (object_type, 0, NULL);
	self->dh_base = (_tmp0_ = dh_base_new (), _g_object_unref0 (self->dh_base), _tmp0_);
	self->dh_frame = (_tmp1_ = _g_object_ref0 (frame), _g_object_unref0 (self->dh_frame), _tmp1_);
	book_manager = _g_object_ref0 (dh_base_get_book_manager (self->dh_base));
	self->dh_book_tree = (_tmp2_ = g_object_ref_sink ((DhBookTree*) dh_book_tree_new (book_manager)), _g_object_unref0 (self->dh_book_tree), _tmp2_);
	self->dh_search = (_tmp3_ = g_object_ref_sink ((DhSearch*) dh_search_new (book_manager)), _g_object_unref0 (self->dh_search), _tmp3_);
	swbooktree = g_object_ref_sink ((GtkScrolledWindow*) gtk_scrolled_window_new (NULL, NULL));
	gtk_scrolled_window_set_policy (swbooktree, GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
	gtk_container_set_border_width ((GtkContainer*) swbooktree, (guint) 6);
	gtk_container_add ((GtkContainer*) swbooktree, (GtkWidget*) self->dh_book_tree);
	frasearch = g_object_ref_sink ((GtkFrame*) gtk_frame_new (NULL));
	gtk_frame_set_shadow_type (frasearch, GTK_SHADOW_NONE);
	gtk_container_set_border_width ((GtkContainer*) frasearch, (guint) 6);
	gtk_container_add ((GtkContainer*) frasearch, (GtkWidget*) self->dh_search);
	gtk_notebook_append_page ((GtkNotebook*) self, (GtkWidget*) swbooktree, (GtkWidget*) (_tmp4_ = g_object_ref_sink ((GtkLabel*) gtk_label_new ("Contents"))));
	_g_object_unref0 (_tmp4_);
	gtk_notebook_append_page ((GtkNotebook*) self, (GtkWidget*) frasearch, (GtkWidget*) (_tmp5_ = g_object_ref_sink ((GtkLabel*) gtk_label_new ("Search"))));
	_g_object_unref0 (_tmp5_);
	g_signal_connect_object (self->dh_book_tree, "link-selected", (GCallback) _devhelp_sidebar_on_link_selected_dh_book_tree_link_selected, self, 0);
	g_signal_connect_object (self->dh_search, "link-selected", (GCallback) _devhelp_sidebar_on_link_selected_dh_search_link_selected, self, 0);
	gtk_widget_show_all ((GtkWidget*) self);
	_g_object_unref0 (frasearch);
	_g_object_unref0 (swbooktree);
	_g_object_unref0 (book_manager);
	return self;
}


DevhelpSidebar* devhelp_sidebar_new (DevhelpViewFrame* frame) {
	return devhelp_sidebar_construct (TYPE_DEVHELP_SIDEBAR, frame);
}


static void devhelp_sidebar_class_init (DevhelpSidebarClass * klass) {
	devhelp_sidebar_parent_class = g_type_class_peek_parent (klass);
	G_OBJECT_CLASS (klass)->finalize = devhelp_sidebar_finalize;
}


static void devhelp_sidebar_instance_init (DevhelpSidebar * self) {
}


static void devhelp_sidebar_finalize (GObject* obj) {
	DevhelpSidebar * self;
	self = DEVHELP_SIDEBAR (obj);
	_g_object_unref0 (self->dh_base);
	_g_object_unref0 (self->dh_book_tree);
	_g_object_unref0 (self->dh_search);
	_g_object_unref0 (self->dh_frame);
	G_OBJECT_CLASS (devhelp_sidebar_parent_class)->finalize (obj);
}


GType devhelp_sidebar_get_type (void) {
	static volatile gsize devhelp_sidebar_type_id__volatile = 0;
	if (g_once_init_enter (&devhelp_sidebar_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (DevhelpSidebarClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) devhelp_sidebar_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (DevhelpSidebar), 0, (GInstanceInitFunc) devhelp_sidebar_instance_init, NULL };
		GType devhelp_sidebar_type_id;
		devhelp_sidebar_type_id = g_type_register_static (GTK_TYPE_NOTEBOOK, "DevhelpSidebar", &g_define_type_info, 0);
		g_once_init_leave (&devhelp_sidebar_type_id__volatile, devhelp_sidebar_type_id);
	}
	return devhelp_sidebar_type_id__volatile;
}


static void _gtk_main_quit_gtk_object_destroy (GtkObject* _sender, gpointer self) {
	gtk_main_quit ();
}


gint _vala_main (char** args, int args_length1) {
	gint result = 0;
	DevhelpViewFrame* dh_view;
	DevhelpSidebar* dh_sidebar;
	GtkHPaned* hpaned;
	GtkWindow* window;
	gtk_init (&args_length1, &args);
	dh_view = g_object_ref_sink (devhelp_view_frame_new ());
	dh_sidebar = g_object_ref_sink (devhelp_sidebar_new (dh_view));
	hpaned = g_object_ref_sink ((GtkHPaned*) gtk_hpaned_new ());
	gtk_paned_add1 ((GtkPaned*) hpaned, (GtkWidget*) dh_sidebar);
	gtk_paned_add2 ((GtkPaned*) hpaned, (GtkWidget*) dh_view);
	gtk_paned_set_position ((GtkPaned*) hpaned, 200);
	window = g_object_ref_sink ((GtkWindow*) gtk_window_new (GTK_WINDOW_TOPLEVEL));
	gtk_window_set_title (window, "Vala DevHelp Bindings Test");
	gtk_window_set_default_size (window, 640, 480);
	window->position = (guint) GTK_WIN_POS_CENTER;
	g_signal_connect ((GtkObject*) window, "destroy", (GCallback) _gtk_main_quit_gtk_object_destroy, NULL);
	gtk_container_add ((GtkContainer*) window, (GtkWidget*) hpaned);
	gtk_widget_show_all ((GtkWidget*) window);
	gtk_main ();
	result = 0;
	_g_object_unref0 (window);
	_g_object_unref0 (hpaned);
	_g_object_unref0 (dh_sidebar);
	_g_object_unref0 (dh_view);
	return result;
}


int main (int argc, char ** argv) {
	g_type_init ();
	return _vala_main (argv, argc);
}




