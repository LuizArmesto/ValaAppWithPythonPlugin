/* videotecapreferenceswindow.vala
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

public class Videoteca.PreferencesWindow : Gtk.Window
{
	private Videoteca.Plugins plugins;

	public PreferencesWindow (Videoteca.Plugins plugins)
	{
		this.plugins = plugins;
		this.title = "Preferences";
		this.window_position = Gtk.WindowPosition.CENTER;
		create_widgets ();
	}

	public void create_widgets ()
	{
		/* Create the buttons */
		var close_button = new Gtk.Button.from_stock (Gtk.Stock.CLOSE);
		close_button.clicked.connect (() => {
			destroy ();
		});
		var help_button = new Gtk.Button.from_stock (Gtk.Stock.HELP);
		help_button.set_sensitive (false);
		/* Set the buttons layout */
		var vbox = new Gtk.VBox (false, 2);
		var button_box = new Gtk.HButtonBox ();
		button_box.set_layout (Gtk.ButtonBoxStyle.EDGE);
		button_box.add (help_button);
		button_box.add (close_button);

		/* Create the content notebook */
		var notebook = new Gtk.Notebook ();
		var content_area = new Gtk.HBox (true, 1);

		/* Plugins tab */
		var plugins_widget = this.plugins.make_widget ();
		notebook.append_page (plugins_widget, new Gtk.Label ("Plugins"));
		content_area.pack_start (notebook, true, true, 0);

		/* Set the correct borders */
		this.border_width = 5;
		notebook.border_width = 5;
		plugins_widget.border_width = 10;

		vbox.pack_start (content_area, true, true, 0);
		vbox.pack_start (button_box, false, true, 0);

		add (vbox);
	}
}
