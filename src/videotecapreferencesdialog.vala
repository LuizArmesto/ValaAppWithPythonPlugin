/* videotecapreferencesdialog.vala
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

public class Videoteca.PreferencesDialog : Gtk.Dialog
{
	public PreferencesDialog (PeasGtk.PluginManager plugins_widget)
	{
		/* Add the buttons */
		/* Using OK and Cancel to get the correct order */
		add_button (Gtk.Stock.HELP, Gtk.ResponseType.CANCEL);
		add_button (Gtk.Stock.CLOSE, Gtk.ResponseType.OK);
		/* Set the buttons layout */
		var vbox = get_children ().nth_data (0) as Gtk.Box;
		var button_box = vbox.get_children ().nth_data (0) as Gtk.ButtonBox;
		button_box.set_layout (Gtk.ButtonBoxStyle.EDGE);
		/* Create the content notebook */
		var notebook = new Gtk.Notebook ();
		/* Plugins tab */
		var plugins_label = new Gtk.Label ("Plugins");
		notebook.append_page (plugins_widget, plugins_label);
		var content_area = get_content_area () as Gtk.Box;
		content_area.pack_start (notebook, true, true, 0);
		/* Set the correct borders */
		this.border_width = 5;
		notebook.border_width = 5;
		plugins_widget.border_width = 10;

	}
}
