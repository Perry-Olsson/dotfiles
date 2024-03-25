from libqtile.lazy import lazy
from libqtile.config import Group, EzKey as Key, Match 

groups = [
            Group(" ", layout="max",        matches=[Match(wm_class=["navigator", "firefox", "vivaldi-stable", "chromium", "brave"])]),
            Group(" ", layout="bsp",  matches=[Match(wm_class=["emacs", "geany", "subl", "vim", "nvim"])]),
            Group(" ", layout="monadtall",  matches=[Match(wm_class=["inkscape", "nomacs", "ristretto", "nitrogen"])]),
            Group(" ", layout="monadtall",  matches=[Match(wm_class=["qpdfview", "thunar", "nemo", "caja", "pcmanfm"])]),
            Group(" ", layout="max",        matches=[Match(wm_class=["telegramDesktop"])]),
            Group(" ", layout="ratiotile"),
            Group(" ", layout="max",        matches=[Match(wm_class=["spotify", "pragha", "clementine", "deadbeef", "audacious"]), Match(title=["VLC media player"])]),
            Group(" ", layout="tile"),
        ]


def init_groups():
    return [
            Group(" ", layout="max",        matches=[Match(wm_class=["navigator", "firefox", "vivaldi-stable", "chromium", "brave"])]),
            Group(" ", layout="bsp",  matches=[Match(wm_class=["emacs", "geany", "subl", "vim", "nvim"])]),
            Group(" ", layout="monadtall",  matches=[Match(wm_class=["inkscape", "nomacs", "ristretto", "nitrogen"])]),
            Group(" ", layout="monadtall",  matches=[Match(wm_class=["qpdfview", "thunar", "nemo", "caja", "pcmanfm"])]),
            Group(" ", layout="max",        matches=[Match(wm_class=["telegramDesktop"])]),
            Group(" ", layout="ratiotile"),
            Group(" ", layout="max",        matches=[Match(wm_class=["spotify", "pragha", "clementine", "deadbeef", "audacious"]), Match(title=["VLC media player"])]),
            Group(" ", layout="tile"),
        ]

