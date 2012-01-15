/* videotecautils.vala
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

Gtk.Window make_mainwindow (Videoteca.Plugins plugins)
{
	var preferences_dialog = make_preferences_dialog (plugins);
	var video_widget = new Videoteca.VideoWidget ();
	var mainwindow = new Videoteca.MainWindow (video_widget, preferences_dialog);
	mainwindow.set_default_size (900, 500);
	/* Exit when the main window is closed */
	mainwindow.destroy.connect (Gtk.main_quit);
	return mainwindow;
}

Gtk.Dialog make_preferences_dialog (Videoteca.Plugins plugins)
{
	var dialog = new Videoteca.PreferencesDialog (plugins.widget);
	return dialog;
}

Videoteca.Plugins make_plugins ()
{
	var plugins = new Videoteca.Plugins ("./plugins");
	return plugins;
}
