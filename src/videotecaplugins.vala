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

public class Videoteca.Plugins : GLib.Object
{
	public Peas.Engine engine;

	public Plugins (string path)
	{
		stdout.printf ("Plugins path: %s\n", path);
		this.engine = Peas.Engine.get_default ();
		this.engine.add_search_path (path, null);
		this.engine.enable_loader ("python");
	}

	public void load ()
	{
		unowned GLib.List<Peas.PluginInfo> plugin_list = this.engine.get_plugin_list ();
		foreach (Peas.PluginInfo plugin in plugin_list)
		{
			stdout.printf ("Plugins list: %s\n", plugin.get_name ());
			this.engine.load_plugin (plugin);
		}
	}

	public PeasGtk.PluginManager make_widget ()
	{
		return new PeasGtk.PluginManager (this.engine);
	}

	public void on_extension_added (Peas.ExtensionSet extension_set, Peas.PluginInfo info, Peas.Activatable? activatable, void* data)
	{
		stdout.printf ("on_extension_added \n");
		//activatable.activate ();
	}

	public Peas.ExtensionSet setup_extension_set (Videoteca.MainWindow window)
	{
		var parameters = new GLib.Parameter[1];
        parameters[0] = { "object", window };
		var extension_set = Peas.ExtensionSet.newv (this.engine, typeof(Peas.Activatable), parameters);
		//extension_set.foreach ((Peas.ExtensionSetForeachFunc) on_extension_added, null);
		extension_set.extension_added.connect ((info, exten) => {
			var activatable = exten as Peas.Activatable;
			activatable.activate ();
		});
		extension_set.extension_removed.connect((info, exten) => {
			var activatable = exten as Peas.Activatable;
			activatable.deactivate ();
		});
		return extension_set;
	}
}
