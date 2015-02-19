#!/bin/bash -i

SRC=.
cd $SRC

valac videoteca.vala --pkg gtk+-3.0 --pkg Videoteca-1.0 --pkg libpeas-1.0 --pkg PeasGtk-1.0 -g --girdir=. --vapidir=. -X videoteca.so -X -I.
valac -g videotecamainwindow.vala videotecapreferenceswindow.vala videotecaplugins.vala videotecautils.vala --pkg gtk+-3.0 --pkg libpeas-1.0 --pkg PeasGtk-1.0 --gir=Videoteca-1.0.gir --library Videoteca-1.0 -X -fPIC -X --shared -o videoteca.so -H videoteca.h
g-ir-compiler --shared-library=videoteca.so Videoteca-1.0.gir -o Videoteca-1.0.typelib
