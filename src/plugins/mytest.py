#!/usr/bin/env python

from gi.repository import GObject
from gi.repository import Gtk
from gi.repository import Peas
from gi.repository import PeasGtk
from gi.repository import Videoteca

print("AEEEEEE")
class PythonTestPlugin(GObject.Object, Peas.Activatable, PeasGtk.Configurable):
    __gtype_name__ = 'PythonTestPlugin'

    object = GObject.property(type=GObject.Object)

    def do_activate(self):
        print("PythonTestPlugin.do_activate", repr(self.object))
        self.object.set_title("Haaa")
        self.new_button = Gtk.ToolButton();
        self.new_button.set_stock_id(Gtk.STOCK_NEW)
        self.object.toolbar.add(self.new_button)
        self.new_button.connect('clicked', self.on_new_button_clicked)
        self.new_button.show()
        #print(dir(self.object))

    def do_deactivate(self):
        print("PythonTestPlugin.do_deactivate", repr(self.object))
        self.object.set_title("Hooo")
        self.object.toolbar.remove(self.new_button);

    def do_update_state(self):
        print("PythonTestPlugin.do_update_state", repr(self.object))

    def do_create_configure_widget(self):
        widget = Gtk.Label("A configuration widget goes here.")
        return widget

    def on_new_button_clicked(self, widget):
        print('teste')
