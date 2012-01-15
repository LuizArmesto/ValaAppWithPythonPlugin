/* videotecamainwindow.vala
 *
 * Copyright (C) 2012 Luiz Armesto <luiz.armesto@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See http://www.gnu.org/copyleft/gpl.html the full text of the
 * license.
 *
 * Author:
 *	  Luiz Armesto <luiz.armesto@gmail.com>
 */

/* TODO */
public class Videoteca.VideoWidget : GLib.Object {}

public class Videoteca.MainWindow: Gtk.Window
{
	private Videoteca.Plugins plugins;
	private WindowConstructor preferences_window_constructor;

	public MainWindow (VideoWidget video_widget, GLib.Object plugins, WindowConstructor preferences_window_constructor)
	{
		this.preferences_window_constructor = preferences_window_constructor;
		this.plugins = plugins as Videoteca.Plugins;

		var vbox = new Gtk.VBox (false, 3);
		var menubar = make_menubar ();
		vbox.pack_start (menubar, false, true, 0);
		var toolbar = make_toolbar ();
		vbox.pack_start (toolbar, false, true, 0);
		add (vbox);
	}

	private Gtk.MenuBar make_menubar ()
	{
		var menubar = new Gtk.MenuBar ();

		/* Create the Movie menu */
		var movie_menuitem = new Gtk.MenuItem ();
		movie_menuitem.label = "_Movie";
		var movie_menu = new Gtk.Menu ();
		movie_menuitem.set_submenu (movie_menu);

		/* Create the Movie menu items */
		/* Movie > Open */
		var movie_open_menuitem = new Gtk.ImageMenuItem.from_stock (Gtk.Stock.OPEN, null);
		movie_open_menuitem.activate.connect (() => {
			stdout.printf ("activated\n");
		});
		/* Add the Movie menu items */
		movie_menu.add (movie_open_menuitem);

		/* Create the Edit menu */
		var edit_menuitem = new Gtk.MenuItem ();
		edit_menuitem.label = "_Edit";
		var edit_menu = new Gtk.Menu ();
		edit_menuitem.set_submenu (edit_menu);

		/* Create the Edit menu items */
		/* Edit > Preferences */
		var edit_preferences_menuitem = new Gtk.ImageMenuItem.from_stock (Gtk.Stock.PREFERENCES, null);
		edit_preferences_menuitem.activate.connect (() => {
			var preferences_window = this.preferences_window_constructor (this.plugins);
			preferences_window.show_all ();
		});
		/* Add the Edit menu items */
		edit_menu.add (edit_preferences_menuitem);

		/* Add the menus to menubar */
		menubar.add (movie_menuitem);
		menubar.add (edit_menuitem);

		return menubar;
	}

	private Gtk.Toolbar make_toolbar ()
	{
		var toolbar = new Gtk.Toolbar ();
		/* Set the main toolbar correct class */
		var context = toolbar.get_style_context ();
		context.add_class (Gtk.STYLE_CLASS_PRIMARY_TOOLBAR);

		/* Create the toolbar buttons */
		var open_button = new Gtk.ToolButton.from_stock (Gtk.Stock.OPEN);

		toolbar.insert (open_button, -1);
		return toolbar;
	}
}
