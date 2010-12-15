using Gtk;
using WebKit;
using Dh;

class DevhelpViewFrame : Gtk.Frame
{
    public WebKit.WebView dh_view;
    
    public DevhelpViewFrame()
    {
        this.set_shadow_type(Gtk.ShadowType.NONE);
        
        this.dh_view = new WebKit.WebView();
        
        Gtk.ScrolledWindow swview = new Gtk.ScrolledWindow(null, null);
        swview.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        
        swview.add(this.dh_view);
        this.add(swview);
        
        this.dh_view.open("about:blank");
        
        this.show_all();
    }
}

class DevhelpSidebar : Gtk.Notebook
{
    public Dh.Base dh_base;
    public Dh.BookTree dh_book_tree;
    public Dh.Search dh_search;
    public DevhelpViewFrame dh_frame;
    
    public void on_link_selected(void *p)
    {
        Dh.Link link = (Dh.Link)p;
        string uri = link.get_uri();
        this.dh_frame.dh_view.open(uri);
    }
    
    public DevhelpSidebar(DevhelpViewFrame frame)
    {
        this.dh_base = new Dh.Base();
        
        this.dh_frame = frame;
        
        Dh.BookManager book_manager = dh_base.get_book_manager();
        
        this.dh_book_tree = new Dh.BookTree(book_manager);
        this.dh_search = new Dh.Search(book_manager);
        
        Gtk.ScrolledWindow swbooktree = new Gtk.ScrolledWindow(null, null);
        swbooktree.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
        swbooktree.border_width = 6;
        swbooktree.add(this.dh_book_tree);
        
        Gtk.Frame frasearch = new Gtk.Frame(null);
        frasearch.set_shadow_type(Gtk.ShadowType.NONE);
        frasearch.border_width = 6;
        frasearch.add(this.dh_search);
        
        this.append_page(swbooktree, new Gtk.Label("Contents"));
        this.append_page(frasearch, new Gtk.Label("Search"));
        
        this.dh_book_tree.link_selected.connect(this.on_link_selected);
        this.dh_search.link_selected.connect(this.on_link_selected);
        
        this.show_all();
    }
    
}

int main(string[] args)
{
    Gtk.init(ref args);
    
    DevhelpViewFrame dh_view = new DevhelpViewFrame();
    DevhelpSidebar dh_sidebar = new DevhelpSidebar(dh_view);

    Gtk.HPaned hpaned = new Gtk.HPaned();
    
    hpaned.add1(dh_sidebar);
    hpaned.add2(dh_view);
    
    hpaned.set_position(200);
    
    var window = new Gtk.Window();
    window.title = "Vala DevHelp Bindings Test";
    window.set_default_size(640,480);
    window.position = WindowPosition.CENTER;
    window.destroy.connect(Gtk.main_quit);
        
    window.add(hpaned);
    window.show_all();
    
    Gtk.main();
    return 0;
}
