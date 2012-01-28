#!/usr/bin/env python

from gi.repository import GObject
from gi.repository import Gtk
from gi.repository import Peas
from gi.repository import PeasGtk

print("AEEEEEE")
class PythonTestPlugin(GObject.Object, Peas.Activatable, PeasGtk.Configurable):
    __gtype_name__ = 'PythonTestPlugin'

    object = GObject.property(type=GObject.Object)

    def do_activate(self):
        print("PythonTestPlugin.do_activate", repr(self.object))
        self.object.set_title("Haaa")
        new_button = Gtk.ToolButton();
        new_button.set_stock_id(Gtk.STOCK_NEW)
        #self.object.toolbar.insert(new_button, -1);
        print(dir(self.object.props))

    def do_deactivate(self):
        print("PythonTestPlugin.do_deactivate", repr(self.object))

    def do_update_state(self):
        print("PythonTestPlugin.do_update_state", repr(self.object))

    def do_create_configure_widget(self):
        widget = Gtk.Label("A configuration widget goes here.")
        return widget
