# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import socket
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"

keys = [
    # The essentials
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),
    Key([mod], "p",
        lazy.spawn("dmenu_run -c -l 10"),
        desc="Dmenu run launcher"),
    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"),
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -1%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +1%")),
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]

group_names = [("WWW", {'layout': 'monadtall'}),
               ("DEV", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall'}),
               ("DOC", {'layout': 'monadtall'}),
               ("VBOX", {'layout': 'monadtall'}),
               ("CHAT", {'layout': 'monadtall'}),
               ("MUS", {'layout': 'monadtall'}),
               ("VID", {'layout': 'monadtall'}),
               ("GFX", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {
    "border_width": 2,
    "border_focus": "#88c0d0",
    "border_normal": "81a1c1",
    "margin": 8
}

layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


colors = [["#2e3440", "#2e3440"], # panel background
          ["#3b4252", "#3b4252"], # background for current screen tab
          ["#434c5e", "#434c5e"], # font color for group names
          ["#4c566a", "#4c566a"], # border line color for current tab
          ["#d8dee9", "#d8dee9"], # border line color for other tab and odd widgets
          ["#8fbcbb", "#8fbcbb"], # color for the even widgets
          ["#81a1c1", "#81a1c1"]] # window name

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='mononoki',
    fontsize=12,
    padding=3,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widget_list = [
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[2],
            background = colors[0]
        ),
        widget.GroupBox(
            font = "mononoki",
            fontsize = 9,
            margin_y = 3,
            margin_x = 0,
            padding_y = 5,
            padding_x = 3,
            borderwidth = 3,
            active = colors[2],
            inactive = colors[2],
            rounded = False,
            highlight_color = colors[1],
            highlight_method = "block",
            this_current_screen_border = colors[3],
            this_screen_border = colors[4],
            other_screen_border = colors[0],
            foreground = colors[2],
            background = colors[0]
        ),
        widget.Prompt(
            prompt = prompt,
            font = "mononoki",
            padding = 10,
            foreground = colors[3],
            background = colors[1]
        ),
        widget.Sep(
            linewidth = 0,
            padding = 40,
            foreground = colors[2],
            background = colors[0]
        ),
        widget.WindowName(
            foreground = colors[6],
            background = colors[0],
            padding = 0
        ),
        widget.TextBox(
            text = '',
            background = colors[0],
            foreground = colors[4],
            padding = 0,
            fontsize = 37
        ),
        widget.Net(
            interface = "enp0s31f6",
            format = '{down} ↓↑ {up}',
            foreground = colors[2],
            background = colors[4],
            padding = 5
        ),
        widget.TextBox(
            text = '',
            background = colors[4],
            foreground = colors[6],
            padding = 0,
            fontsize = 37
        ),
        widget.TextBox(
            text = " Vol: ",
            foreground = colors[2],
            background = colors[6],
            padding = 0
        ),
        widget.Volume(
            foreground = colors[2],
            background = colors[6],
            padding = 5
        ),
        widget.TextBox(
            text = '',
            background = colors[6],
            foreground = colors[4],
            padding = 0,
            fontsize = 37
        ),
        widget.CurrentLayout(
            foreground = colors[2],
            background = colors[4],
            padding = 5
            ),
        widget.TextBox(
            text = '',
            background = colors[4],
            foreground = colors[6],
            padding = 0,
            fontsize = 37
        ),
        widget.Clock(
            foreground = colors[2],
            background = colors[6],
            format = "%A, %d.%b  [ %H:%M ]"
        ),
        widget.Sep(
            linewidth = 0,
            padding = 10,
            foreground = colors[0],
            background = colors[6]
        ),
        widget.Systray(
            background = colors[0],
            padding = 5
        ),

    ]
    return widget_list

def init_widget_screen():
    widget_screen = init_widgets_list()
    return widget_screen

def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_widget_screen(), opacity=0.95, size = 20)),
        Screen(top=bar.Bar(widgets=init_widget_screen(), opacity=0.95, size = 20)),
    ]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widget_list = init_widgets_list()
    widgets_screen = init_widget_screen()


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"