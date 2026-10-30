[![License](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://gitlab.xfce.org/panel-plugins/xfce4-notes-plugin/-/blob/master/COPYING)

# xfce4-notes-plugin

The notes plugin provides you a quick way to write down a todo list,
to paste a piece of code, to leave a note to your friend, or whatever
else you had like to do with a Post-It note.

### This fork

- A notes folder that already has files in it is opened as it is, nothing is moved.
- Every folder is a window named by its path (`Work/Ideas`); loose files at the top go in a window named after the
  notes folder; hidden files and folders (`.git`, `.stfolder`) are skipped.
- Notes in a legacy encoding (the locale's, Windows-1252, Latin-1) load, and are saved back as UTF-8 once edited.
- Files that sync tools or other programs write while a note is being saved are no longer missed.
- Scrolling over the title bar moves between notes; Shift+scroll shades, Alt+scroll sets the transparency.
- A thicker frame to grab for resizing.
- `xfce4-popup-notes` (show/hide all notes) is bound to Super+N on first start unless it already has a key; change it
  in Settings → Keyboard → Application Shortcuts.
- The window title shows only the note's name.

----

### Homepage

[xfce4-notes-plugin documentation](https://docs.xfce.org/panel-plugins/xfce4-notes-plugin)

### Changelog

See [NEWS](https://gitlab.xfce.org/panel-plugins/xfce4-notes-plugin/-/blob/master/NEWS)
for details on changes and fixes made in the current release.

### Source Code Repository

[Xfce4-notes-plugin source code](https://gitlab.xfce.org/panel-plugins/xfce4-notes-plugin)

### Download a Release Tarball

[Xfce4-notes-plugin archive](https://archive.xfce.org/src/panel-plugins/xfce4-notes-plugin)
    or
[Xfce4-notes-plugin tags](https://gitlab.xfce.org/panel-plugins/xfce4-notes-plugin/-/tags)

### Installation

From source code repository: 

    % cd xfce4-notes-plugin
    % meson setup build
    % meson compile -C build
    % meson install -C build

From release tarball:

    % tar xf xfce4-notes-plugin-<version>.tar.xz
    % cd xfce4-notes-plugin-<version>
    % meson setup build
    % meson compile -C build
    % meson install -C build

### Uninstallation

    % ninja uninstall -C build

### Reporting Bugs

Visit the [reporting bugs](https://docs.xfce.org/panel-plugins/xfce4-notes-plugin/bugs)
page to view currently open bug reports and instructions on reporting new bugs or
submitting bugfixes.

