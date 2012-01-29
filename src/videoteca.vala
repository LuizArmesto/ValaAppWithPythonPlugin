/* videoteca.vala
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

class Main : GLib.Object
{
	public static int main (string[] args) {
		Gtk.init (ref args);

		var plugins = Videoteca.make_plugins ();
		var mainwindow = Videoteca.make_mainwindow (plugins);

		mainwindow.show_all ();
		plugins.setup_extension_set (mainwindow);

		plugins.load ();

		plugins.extension_set.foreach ((Peas.ExtensionSetForeachFunc) plugins.extension_update_state, null);

		Gtk.main ();
		return 0;
	}
}
