import os
from libqtile import bar, qtile, widget
from libqtile.config import Screen
from constants import CONSTANTS
theme = CONSTANTS.THEME

class PowerlineTheme(enumerate):
    THEME_ONE = theme["bright_magenta"]
    THEME_TWO = theme["cyan_blue"]

theme_tuple_two = (PowerlineTheme.THEME_ONE, PowerlineTheme.THEME_TWO)
theme_tuple_one = (PowerlineTheme.THEME_TWO, PowerlineTheme.THEME_ONE)

def themed_left_to_right_powerline(theme_tuple, is_last_power_line = False):
    return powerline_seprator(theme_tuple, '▶', is_last_power_line)

def themed_right_to_left_powerline(theme_tuple, is_last_power_line = False):
    return powerline_seprator(theme_tuple, '', is_last_power_line)

def powerline_seprator(theme_tuple, arrow, is_last_power_line):
    return widget.TextBox(
            background=theme["dark_gray_blue"] if is_last_power_line else theme_tuple[0],
            fontsize=35,
            foreground=theme_tuple[1],
            padding=0,
            text=arrow
            )

class WidgetConfig:
    font_size = 14
    icon_font_size = 16
    padding = 10
    background = theme["dark_gray_blue"]
    foreground = theme["white"]

widget_config = WidgetConfig()

def init_screens():
    return [ 
            Screen(
                top=bar.Bar(
                    [ 
                        widget.Sep(
                            background=theme["dark_gray_blue"],
                            foreground=theme["very_dark_gray_blue"], #d8dee9
                            linewidth=1,
                            padding=10 
                            ),
                        widget.Image(
                            filename="~/.config/qtile/icons/qtilelogo.png",
                            iconsize=8,
                            background=theme["dark_gray_blue"],
                            mouse_callbacks={'Button1': lambda : qtile.cmd_spawn('rofi -show run')}
                            ),
                        # widget.Sep(
                        #     background=theme["dark_gray_blue"],
                        #     foreground=theme["very_dark_gray_blue"],
                        #     linewidth=1,
                        #     padding=10
                        # ),
                        widget.GroupBox(
                            active=theme["slightly_desaturated_red"], 
                            background=theme["dark_gray_blue"],
                            borderwidth=2,
                            disable_drag=True,
                            font='Ubuntu Nerd Font',
                            fontsize=18,
                            hide_unused=False,
                            highlight_method='line',
                            inactive=theme["very_dark_gray_blue"],
                            margin_x=0,
                            margin_y=3,
                            padding_x=5,
                            padding_y=8,
                            rounded=False,
                            this_current_screen_border=theme["soft_orange"],
                            urgent_alert_method='line'
                        ),
                        widget.Sep(
                            background=theme["dark_gray_blue"],
                            foreground=theme["very_dark_gray_blue"],
                            linewidth=1,
                            padding=10
                        ),
                        widget.CurrentLayoutIcon(
                            background=theme["dark_gray_blue"],
                            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                            foreground=theme["very_dark_gray_blue"],
                            padding=0,
                            scale=0.65
                        ),
                        widget.Sep(
                            background=theme["dark_gray_blue"],
                            foreground=theme["very_dark_gray_blue"],
                            linewidth=1,
                            padding=10
                        ),
                        widget.CurrentLayout(
                            background=theme["dark_gray_blue"],
                            font='Ubuntu Bold',
                            foreground=theme["very_dark_gray_blue"],
                            padding=5
                        ),
                        widget.Sep(
                            background=theme["dark_gray_blue"],
                            foreground=theme["very_dark_gray_blue"],
                            linewidth=1,
                            padding=10
                        ),
                        widget.Prompt(
                            background=theme["dark_gray_blue"],
                            font='Ubuntu',
                            fontsize=12,
                            foreground=theme["very_dark_gray_blue"]
                        ),
                        widget.Spacer(),
                        widget.Volume(
                            background = theme_tuple_two[0],
                            emoji=True,
                            padding=widget_config.padding,
                            fontsize=widget_config.icon_font_size
                            ),
                        widget.CapsNumLockIndicator(
                            background=theme_tuple_one[0],
                            font='Ubuntu',
                            fontsize=widget_config.font_size,
                            foreground=widget_config.foreground,
                            padding=widget_config.padding,
                            scroll=True,
                            scroll_fixed_width=True,
                            width=125
                        ),
                        widget.Sep(
                            background=theme_tuple_two[0],
                            foreground=theme_tuple_two[0],
                            padding=widget_config.padding
                        ),
                        widget.TextBox(
                            background=theme_tuple_two[0],
                            font='Ubuntu Nerd Font',
                            fontsize=widget_config.icon_font_size,
                            foreground=widget_config.foreground,
                            padding=0,
                            text=' '
                        ),
                        widget.Memory(
                            background=theme_tuple_two[0],
                            fontsize=widget_config.font_size,
                            foreground=widget_config.foreground,
                            font='Ubuntu',
                            format="{MemUsed: .0f}{mm}",
                            update_interval=1.0,
                            scroll=True,
                            scroll_fixed_width=True,
                            width=55
                        ),
                        widget.Sep(
                            background=theme_tuple_two[0],
                            foreground=theme_tuple_two[0],
                            padding=widget_config.padding
                        ),
                        widget.Sep(
                            background=theme_tuple_one[0],
                            foreground=theme_tuple_one[0],
                            padding=widget_config.padding
                        ),
                        widget.TextBox(
                            background=theme_tuple_one[0],
                            font='Ubuntu Nerd Font',
                            fontsize=20,
                            foreground=theme["very_dark_gray_blue"],
                            padding=0,
                            text=' '
                        ),
                        widget.CPU(
                            background=theme_tuple_one[0],
                            font='Ubuntu',
                            fontsize=widget_config.font_size,
                            foreground=widget_config.foreground,
                            format='CPU {load_percent}%',
                            update_interval=1,
                            padding=widget_config.padding,
                            scroll=True,
                            scroll_fixed_width=True,
                            width=100
                        ),
        #                widget.Net(
        #                    background=theme_tuple_two[0],
        #                    font='Ubuntu',
        #                    fontsize=widget_config.font_size,
        #                    foreground=widget_config.foreground,
        #                    format='{interface}: {down} ↓ ',
        #                    interface='all',
        #                    padding=3,
        #                ),
                        widget.NetGraph(
                            background=theme_tuple_two[0],
                            bandwidth="down",
                            border_color=theme["very_dark_gray_blue"],
                            border_width=0,
                            fill_color=theme_tuple_two[0], #88c0d0
                            foreground=theme_tuple_two[0],
                            graph_color=theme["white"],
                            interface="auto",
                            line_width=1,
                            padding=widget_config.padding,
                            type='linefill'
                        ),
                        widget.TextBox(
                            background=theme_tuple_one[0],
                            font='Ubuntu Nerd Font',
                            fontsize=14,
                            foreground=widget_config.foreground,
                            padding=widget_config.padding,
                            text=' '
                        ),
                        widget.Clock(
                            background=theme_tuple_one[0],
                            font='Ubuntu',
                            fontsize=widget_config.font_size,
                            foreground=widget_config.foreground,
                            padding=5,
                            format='%a %d, (%B) %H:%M:%S '
                        ),
                    ],
                    28,
                    opacity=1,
                    background=theme["dark_gray_blue"],
                ),
            ),
        ]
