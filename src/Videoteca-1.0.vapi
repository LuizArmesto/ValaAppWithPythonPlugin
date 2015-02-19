/* Videoteca-1.0.vapi generated by valac 0.17.0, do not modify. */

namespace Videoteca {
	[CCode (cheader_filename = "videoteca.h")]
	public class MainWindow : Gtk.Window {
		public Gtk.MenuBar menubar;
		public Gtk.Toolbar toolbar;
		public MainWindow (Videoteca.VideoWidget video_widget, GLib.Object plugins, Videoteca.WindowConstructor preferences_window_constructor);
		public Gtk.Toolbar get_toolbar ();
	}
	[CCode (cheader_filename = "videoteca.h")]
	public class Plugins : GLib.Object {
		public Peas.Engine engine;
		public Peas.ExtensionSet extension_set;
		public Plugins (string path);
		public void extension_update_state (Peas.PluginInfo info, Peas.Extension exten);
		public void load ();
		public PeasGtk.PluginManager make_widget ();
		public Peas.ExtensionSet setup_extension_set (Videoteca.MainWindow window);
	}
	[CCode (cheader_filename = "videoteca.h")]
	public class PreferencesWindow : Gtk.Window {
		public PreferencesWindow (Videoteca.Plugins plugins);
		public void create_widgets ();
	}
	[CCode (cheader_filename = "videoteca.h")]
	public class VideoWidget : GLib.Object {
		public VideoWidget ();
	}
	[CCode (cheader_filename = "videoteca.h")]
	public delegate Gtk.Window WindowConstructor (Videoteca.Plugins plugins);
	[CCode (cheader_filename = "videoteca.h")]
	public static Videoteca.MainWindow make_mainwindow (Videoteca.Plugins plugins);
	[CCode (cheader_filename = "videoteca.h")]
	public static Videoteca.Plugins make_plugins ();
	[CCode (cheader_filename = "videoteca.h")]
	public static Gtk.Window make_preferences_window (Videoteca.Plugins plugins);
}