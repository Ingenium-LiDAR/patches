#!/bin/bash

#AB Test patch file to alter the UI of the computer where it runs.


#AB Set global color scheme to dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

#AB Configure Terminal theme
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'") #AB Get the current default Terminal profile ID
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ palette "['#171421', '#C01C28', '#26A269', '#A2734C', '#12488B', '#A347BA', '#2AA1B3', '#D0CFCC', '#5E5C64', '#F66151', '#33DA7A', '#E9AD0C', '#2A7BDE', '#C061CB', '#33C7DE', '#FFFFFF']" #AB set default dark terminal theme colors
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ background-color 'rgb(30,30,30)' #AB Set the background and foreground (text) to the default dark colors
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ foreground-color 'rgb(208,207,204)'

#AB Set accent color to blue
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'

echo "1" > ~/.patches.txt #AB the > operator completely overwrites what is already there.