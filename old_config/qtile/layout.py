from libqtile import layout

def _init_layout_theme():
    return {
            "margin": 0,
            "border_width": 1,
            "border_focus": '#5e81ac',
            "border_normal": '#4c566a'
            }

layout_theme = _init_layout_theme()

def init_layout():
    return [
                # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
                layout.Max(**layout_theme),
                # Try more layouts by unleashing below layouts.
                # layout.Stack(num_stacks=2, **layout_theme),
                layout.Bsp(**layout_theme),
                layout.Matrix(**layout_theme),
                layout.MonadTall(**layout_theme),
                layout.MonadWide(**layout_theme),
                layout.RatioTile(**layout_theme),
                layout.Tile(**layout_theme),
                #layout.TreeTab(
                #    sections=['FIRST', 'SECOND'],
                #    bg_color='#3b4252',
                #    active_bg='#bf616a',
                #    inactive_bg='#a3be8c',
                #    padding_y=5,
                #    section_top=10,
                #    panel_width=280
                #),
                # layout.VerticalTile(),
                # layout.Zoomy(),
            ]
