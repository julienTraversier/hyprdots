# --// Hyprdots Theming //--

```shell
      _  _    _____               _     _          _____ _             _              _  _ 
     / |/ |  |  |  |_ _ ___ ___ _| |___| |_ ___   |_   _| |_ ___ _____|_|___ ___     / |/ |
    / // /   |     | | | . |  _| . | . |  _|_ -|    | | |   | -_|     | |   | . |   / // / 
   |_/|_/    |__|__|_  |  _|_| |___|___|_| |___|    |_| |_|_|___|_|_|_|_|_|_|_  |  |_/|_/  
                   |___|_|                                                  |___|          
```


## Theme Structure

To create/add new theme (for ex. `My-Fav-Theme`), here are the files configured to theme the base [applications](#theming-applications)

> **Note**
>
> The theme name `My-Fav-Theme` should be consistent for all config file name

```shell
~/.config/
    |
    +--> hypr/themes/
    |   |
    |   +--> My-Fav-Theme.conf
    |
    +--> kitty/themes/
    |   |
    |   +--> My-Fav-Theme.conf
    |
    +--> Kvantum/My-Fav-Theme/
    |   |
    |   +--> My-Fav-Theme.kvconfig
    |   +--> My-Fav-Theme.svg
    |
    +--> qt5ct/colors/
    |   |
    |   +--> My-Fav-Theme.conf
    |
    +--> rofi/themes/
    |   |
    |   +--> My-Fav-Theme.rasi
    |
    +--> swww/
    |   |
    |   +--> wall.ctl   # main control file
    |   +--> My-Fav-Theme/*   # place wallpapers here
    |
    +--> waybar/themes/
        |
        +--> My-Fav-Theme.css

~/.icons/
    |
    +--> <your-Fav-icon-pack>/   # for icons
    +--> <your-Fav-cursor-pack>/   # for cursors

~/.themes/
    |
    +--> My-Fav-Theme/   # main theme for GTK apps
```


## Theming Applications

These are the applications currently supported by the `themeswitch.sh` script
- [gtk apps](#gtk-apps)
- [qt apps](#qt-apps)
- [hypr](#hypr)
- [waybar](#waybar)
- [kitty](#kitty)
- [rofi](#rofi)
- [flatpak](#flatpak)
- [swww](#swww)
- wlogout (to be added later)


### GTK apps

Download GTK3/4 themes and extract it to `~/.themes/My-Fav-Theme`.   
Themes are available in https://www.gnome-look.org/browse?cat=135&ord=rating.   
You can also make your own gtk theme if you have time!   


### QT apps

For QT5 apps, the plasma style is themed by `kvantum` and its color scheme is handled by `qt5ct`.   
Copy the corresponding config file from any existing theme and modify the color codes in file `~/.config/Kvantum/My-Fav-Theme/My-Fav-Theme.kvconfig` and use vector tool like inkscape to alter color in `~/.config/Kvantum/My-Fav-Theme/My-Fav-Theme.svg`.   
Alter the same color codes in `~/.config/qt5ct/colors/My-Fav-Theme.conf` as well.   
Please keep all the colors consistent with the corresponding GTK theme.   


### Hypr

The global theme settings are configured in `~/.config/hypr/themes/My-Fav-Theme.conf`, this file sets the,
- general hyprland settings like,
    - gaps
    - borders
    - border colors
    - window layout
- cursor theme and size
- gtk theme and icons
- kavantum theme
- fonts (gtk)


### Waybar

Copy the corresponding config file from any existing theme and modify the color codes in file `~/.config/waybar/themes/My-Fav-Theme.css`   
Please keep all the colors consistent with the corresponding GTK and QT theme.   


### Kitty

Copy the corresponding config file from any existing theme and modify the color codes in file `~/.config/kitty/themes/My-Fav-Theme.conf`   
Please keep all the colors consistent with the corresponding GTK and QT theme.   


### Rofi

Copy the corresponding config file from any existing theme and modify the color codes in file `~/.config/rofi/themes/My-Fav-Theme.rasi`   
Please keep all the colors consistent with the corresponding GTK and QT theme.   


### Flatpak

Flatpaks automatically picks the gtk theme set in `~/.config/hypr/themes/My-Fav-Theme.conf`, so no configuration is required.   
Also please note, Flatpak QT apps currently does not support theming.   


### Swww

Place all the wallpapers (should be valid image files or animated gif files) matching the theme in a folder for example `~/.config/swww/My-Fav-Theme/*`.   
Then add any one of the wallpaper filename (with path) in the `|` delimited control file `~/.config/swww/wall.ctl` as shown here,   

```shell
❯ cat ~/.config/swww/wall.ctl
1|Catppuccin-Mocha|~/.config/swww/Catppuccin-Mocha/forest_dark_winter.jpg
0|Catppuccin-Latte|~/.config/swww/Catppuccin-Latte/jormungandr.jpg
0|Decay-Green|~/.config/swww/Decay-Green/moments_before_desk.png
0|My-Fav-Theme|<image file with full path>
```
where column,
1. is `0` or `1`, where `1` indicates the current theme in use
2. is the theme name `My-Fav-Theme`
3. is the Dir/Wallpaper to be used for `My-Fav-Theme`

The `swwwallpaper.sh` script is used to cycle through all the wallpapers in the directory, it also automatically updates (column 3) this control file with the current wallpaper used.   

```shell
❯ cd ~/.config/swww
❯ ./swwwallpaper.sh -n   # to set next wallpaper
❯ ./swwwallpaper.sh -p   # to set previous wallpaper
❯ ./swwwallpaper.sh -t   # display tooltip
```
> **Note**
>
> Please add this theme/wallpaper entry in `wall.ctl` file only after all [these](#theming-applications) theme files are configured.


## Theme Switch

All themes configured in your system is controlled using `themeswitch.sh` script.   
It loops through all the themes (column 2) listed in the control file `~/.config/swww/wall.ctl` and applies it to the supported apps.   

```shell
❯ cd ~/.config/hypr/scripts
❯ ./themeswitch.sh -n   # to set next theme
❯ ./themeswitch.sh -p   # to set previous theme
❯ ./themeswitch.sh -t   # display tooltip
❯ ./themeswitch.sh -s My-Fav-Theme   # to set My-Fav-Theme
```


## Theme Select

The `themeselect.sh` script can be used to launch a rofi menu for selecting and applying a theme from the list of available themes.   
This list source themes from `~/.config/swww/wall.ctl` and triggers `themeswitch.sh` script to apply it.   
Thumbnails used in this rofi theme select menu can be refresed based on the current wallpapers linked to its corresponding theme.   

```shell
❯ cd ~/.config/hypr/scripts
❯ ./themeselect.sh   # launch theme select menu
❯ ./themeselect.sh T   # refresh thumbnails for theme select menu
```
