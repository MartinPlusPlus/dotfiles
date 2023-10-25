# Reload config using <mod> + ctrl + r

import os
import subprocess

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from colors import Colors

# Get some colors
palette = Colors()

# Constants
mod = "mod4"
terminal = guess_terminal()
home_path = os.path.expanduser("~")

# Autostart
@hook.subscribe.startup_once
def startup_once():
    autostart = os.path.expanduser('/home/martin/.config/qtile/autostart.sh')
    subprocess.call([autostart])
    subprocess.call([os.path.expanduser('~/.config/dotfiles/trackpad.sh')])

# Keyboard layouts
keyboards = ['us', 'es']

# Keyboard shortcuts
keys = [
    # Switch keyboard layouts
    # Key(["control", mod], "space", lazy.spawn(home_path + "/.config/keyboard_layout/prev_layout.sh")),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard()),

    # Toggle floating
    Key([mod], "t", lazy.window.toggle_floating()),

    # Change brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10")),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #Key([mod], "space", lazy.layout.next(),
    #    desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Spawn a new process
    Key([mod], "d", lazy.spawn("rofi -show drun -theme solarized")),

    # Sound
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
            "pamixer -d 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
            "pamixer -i 5")),

    # Lock screen
    Key(["control", "mod1"], "l", lazy.spawn("i3lock-fancy-rapid 5 3")),

    # Shut down
    Key([mod, "control", "shift"], "Return", lazy.spawn("shutdown now")),
]

groups = [Group(i) for i in "123456789"]
#groups = [Group(i) for i in range(6)]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    #layout.Columns(border_focus_stack='#d75f5f', margin=8),
    #layout.Columns(
    #    border_width=0, margin=8),
    #    border_width=0,
    #    margin=[10, 10, 10, 10],
    #    font="Fira Code",
    #    fontsize=10,
    #),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    layout.RatioTile(margin=10),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Fira Code',
    fontsize=11,
    padding=8,
)
extension_defaults = widget_defaults.copy()

# Separator Widget
separator = widget.Sep(forground=palette.DARK)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize=12,
                    padding_x=5,
                    borderwidth=0,
                    active=palette.WHITE,
                    inactive=palette.WHITE,
                    rounded=True,
                    font="Fira Code",
                    highlight_method="block",
                    highlight_color=palette.DARK,
                    block_highlight_text_color=palette.WHITE,
                    this_current_screen_border=palette.SECONDARY,
                    foreground=palette.DARK,
                    background=palette.DARK,
                    hide_unused=True
                ),
                widget.Prompt(),
                widget.Spacer(),
                widget.WindowName(
                    fontsize=10,
                    font="Fira Code",
                    format='{name}'
                ),
                widget.Spacer(),
                widget.KeyboardLayout(configured_keyboard=keyboards),
                widget.CurrentLayout(),
                widget.Memory(measure_mem='M'),
                separator,
                widget.PulseVolume(
                    get_volume_command="pamixer --get-volume"
                ),
                widget.Systray(padding=0),
                widget.Battery(charge_char='+', discharge_char='-'),
                separator,
                widget.Clock(format='%a %I:%M %p',
                             padding=10,),
            ],
            30,                         # Bar thickness
            margin=[0, 0, 0, 0],     # Space around bar
            background=palette.DARK,    # Background color
            opacity=1,                  # Opacity from 0 - 1
        ),
    ),
]

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
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
