/* videotecaplugins.vala
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

public class Videoteca.Plugins
{
	public Peas.Engine engine;
	public PeasGtk.PluginManager widget;

	public Plugins (string path)
	{
		stdout.printf ("Plugins path: %s\n", path);
		this.engine = Peas.Engine.get_default();
		this.engine.add_search_path(path, null);
		this.engine.enable_loader("python");
		unowned GLib.List<Peas.PluginInfo> plugins_list = this.engine.get_plugin_list();
		var first_plugin = plugins_list.nth_data(0);
		stdout.printf ("Plugins list: %s\n", first_plugin.get_name());
		this.engine.load_plugin(first_plugin);

		this.widget = make_widget ();
	}

	public PeasGtk.PluginManager make_widget ()
	{
		return new PeasGtk.PluginManager (this.engine);
	}
}
