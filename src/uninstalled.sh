#!/bin/bash -i

SRC=.

export LD_LIBRARY_PATH=$SRC:$LD_LIBRARY_PATH
export GI_TYPELIB_PATH=$SRC:$GI_TYPELIB_PATH

# if we got a command, run it, else start a shell
if test ! -z "$1";
then
  $@
  exit $?
fi

# set up prompt to help us remember we're in a subshell, cd to
# the gstreamer base dir and start $SHELL
cd $SRC
shell=$SHELL
if test "x$SHELL" = "x/bin/bash"
then
  # debian/ubuntu resets our PS1.  bastards.
  shell="$SHELL --noprofile"
fi
PS1="[videoteca] $PS1" $shell
