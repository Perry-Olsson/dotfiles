from typing import List
from libqtile.config import EzKey as Key, Group 
from libqtile.lazy import lazy
from constants import CONSTANTS
from functions import shutdown


def init_keys(groups: List[Group]):
    keys = [
                # Switch between windows
                Key("M-h", lazy.layout.left(), desc="Move focus to left"),
                Key("M-l", lazy.layout.right(), desc="Move focus to right"),
                Key("M-j", lazy.layout.down(), desc="Move focus down"),
                Key("M-k", lazy.layout.up(), desc="Move focus up"),
                Key("M-<space>", lazy.layout.next(),
                    desc="Move window focus to other window"),

                # Move windows between left/right columns or move up/down in current stack.
                # Moving out of range in Columns layout will create new column.
                Key("M-S-h", lazy.layout.shuffle_left(),
                    desc="Move window to the left"),
                Key("M-S-l", lazy.layout.shuffle_right(),
                    desc="Move window to the right"),
                Key("M-S-j", lazy.layout.shuffle_down(),
                    desc="Move window down"),
                Key("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

                # Grow windows. If current window is on the edge of screen and direction
                # will be to screen edge - window would shrink.
                # bsp keys
                Key("M-A-h", lazy.layout.grow_left(),
                    desc="Grow window to the left"),
                Key("M-A-l", lazy.layout.grow_right(),
                    desc="Grow window to the right"),
                Key("M-A-j", lazy.layout.grow_down(),
                    desc="Grow window down"),
                Key("M-A-k", lazy.layout.grow_up(), desc="Grow window up"),
                Key("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
                # monad wide
                Key("M-A-i", lazy.layout.grow(), desc="Grow window"),
                Key("M-A-m", lazy.layout.shrink(), desc="Shrink window"),
                Key("M-A-n", lazy.layout.normalize(), desc="normalize window sizes"),
                Key("M-A-o", lazy.layout.minimize(), desc="minimize window sizes"),

                # Toggle between split and unsplit sides of stack.
                # Split = all windows displayed
                # Unsplit = 1 window displayed, like Max layout, but still with
                # multiple stack panes
                Key("M-S-<Return>", lazy.layout.toggle_split(),
                    desc="Toggle between split and unsplit sides of stack"),

                # Toggle between different layouts as defined below
                Key("M-<Tab>", lazy.next_layout(), desc="Toggle between layouts"),
                Key("M-w", lazy.window.kill(), desc="Kill focused window"),

                # Session commands
                Key("M-C-r", lazy.restart(), desc="Restart Qtile"),
                Key("M-C-q", lazy.shutdown(), desc="Shutdown Qtile"),
                Key("M-r", lazy.spawncmd(),
                    desc="Spawn a command using a prompt widget"),
                Key("M-C-x", shutdown, desc="Shutdown system with confirmation prompt"),

                # Keybindings to launch user defined programs
                Key("A-d", lazy.spawn("dmenu_run"), desc="Launch dmenu"),
                Key("A-e", lazy.spawn("emacs"), desc="Launch emacs"),
                Key("A-f", lazy.spawn("thunar"), desc="Launch thunar"),
                Key("A-m", lazy.spawn("/usr/local/src/thunderbird/thunderbird"), desc="Launch thunderbird"),
                Key("A-n", lazy.spawn("nitrogen"), desc="Launch nitrogen"),
                Key("A-r", lazy.spawn("rofi -show run"), desc="Launch rofi"),
                Key("A-s", lazy.spawn("st"), desc="Launch suckless terminal"),
                Key("A-t", lazy.spawn(CONSTANTS.TERMINAL), desc="Launch terminal"),
                Key("A-w", lazy.spawn("/usr/local/src/waterfox/waterfox-bin"), desc="Launch waterfox"),
                Key("A-C-w", lazy.spawn("brave-browser"), desc="Launch brave-browser"),
                Key("A-C-s", lazy.spawn("/usr/local/src/sublime_text/sublime_text"), desc="Launch sublime_text"),
            ]
    
    for k, group in zip(["1", "2", "3", "4", "5", "6", "7", "8"], groups):
        keys.append(Key("M-"+(k), lazy.group[group.name].toscreen()))
        keys.append(Key("M-S-"+(k), lazy.window.togroup(group.name)))

    return keys
