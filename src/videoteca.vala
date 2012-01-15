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

class Videoteca.Main : GLib.Object
{
	public static int main (string[] args) {
		Gtk.init (ref args);

		var plugins = make_plugins ();
		var mainwindow = make_mainwindow (plugins);
		stdout.printf ("Hello, World 2\n");
		mainwindow.show_all ();

		Gtk.main ();
		return 0;
	}
}
