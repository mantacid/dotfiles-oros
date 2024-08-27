# Installation
These dotfiles were created and managed using `stow`, and thus require the tool to be installed.
See `man stow` for information on how to use the tool.

`zinit` will also need to be installed and set up, at which point the dotfiles can be loaded to the target folders. The zsh plugins *should* install automatically.

# Keyboard Shortcuts
## Window management
- `alt`+`[1-4]`: switch to 1st/2nd/3rd/4th desktop
  - hold `shift` to move the selected window to that desktop
- `alt`+`left|right|up|down`: either moves the widow or resized it, depending on the selected Krohnkite tiling mode.
- `alt`+`q`: close window
- `alt`+`-|=`: decrease/increase selected window's width
  - hold `shift` to change height instead.
- `right-shift`+`back|forward`: previous/next tiling layout
- `alt`+`back-forward`: select previous/next window
## Applications
- `alt`+`ENTER`: Konsole
- `alt`+`f`: firefox
- `alt`+`d`: dolphin
- `alt`+`s`: kde settings
- `alt`+`l`: lem (SDL2)

I likely forgot a number of shortcuts I use. I've included the config files for the keyboard shortcuts in this repo, so take a look and tweak them to your liking.

# Screenshots
![Picture of the desktop, showing a dock on the left side and the tray at the top.](res/desktop.png)
![A picture of a glassy console window, showing the output of a customized fastfetch](res/fetch.png)
![A fullscreen start menu, with favorites on the left, apps in the middle, and categories on the right.](res/start.png)
![A screenshot demonstrating the Krohnkite window tiling by having Konsole, Kate, and Dolphin all open on the same desktop.](res/workflow.png)
