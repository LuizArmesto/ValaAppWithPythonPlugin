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

public delegate Gtk.Window Videoteca.WindowConstructor (Videoteca.Plugins plugins);

public class Videoteca.Plugins : GLib.Object
{
	public Peas.Engine engine;
	public Peas.ExtensionSet extension_set;

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

	public void extension_update_state (Peas.PluginInfo info, Peas.Extension exten, void* data)
	{
		var activatable = exten as Peas.Activatable;
		activatable.update_state ();
	}

	public Peas.ExtensionSet setup_extension_set (Videoteca.MainWindow window)
	{
		this.extension_set = new Peas.ExtensionSet (this.engine, typeof (Peas.Activatable), "object", window, null);
		this.extension_set.extension_added.connect ((info, exten) => {
			var activatable = exten as Peas.Activatable;
			activatable.activate ();
		});
		this.extension_set.extension_removed.connect((info, exten) => {
			var activatable = exten as Peas.Activatable;
			activatable.deactivate ();
		});
		return this.extension_set;
	}
}
