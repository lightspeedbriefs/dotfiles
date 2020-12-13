#!/bin/bash

dir=~/dotfiles                              # dotfiles directory
olddir=~/dotfiles_old                       # old dotfiles backup directory
nvim_plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
vim_plug_dir="$HOME/.vim/autoload"
# list of files/folders to symlink in homedir
files="vimrc gitconfig minttyrc colorgccrc color_coded clang_complete ycm_extra_conf.py zshenv zshrc"

if ! command -v curl &>/dev/null ; then
    echo "curl is not installed, please install first and then run this script" >&2
    exit 1
fi

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
'mkdir' -p $olddir
echo "done"

'curl' -fLo "$nvim_plug" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
'mkdir' -p "$vim_plug_dir"
'cp' "$nvim_plug" "$vim_plug_dir"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd "$dir" || exit
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    [[ -s "$HOME/.$file" ]] && 'mv' -b "$HOME/.$file" ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    'ln' -s "$dir/$file" "$HOME/.$file"
done

'mkdir' -p ~/.config/nvim
file=~/.config/nvim/init.vim
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
'ln' -s $dir/vimrc $file

'mkdir' -p ~/.config/kitty
file=~/.config/kitty/kitty.conf
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
'ln' -s $dir/kitty.conf $file

'mkdir' -p ~/.config/bat
file=~/.config/bat/config
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
'ln' -s $dir/batconfig $file

file=~/.gdbinit
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
'curl' -fLo $file https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit

file=~/.gdbinit.d/colors.gdb
'curl' -fLo $file --create-dirs https://raw.githubusercontent.com/RAttab/dotfiles/master/colors.gdb

file=~/.dir_colors
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
'curl' -fLo $file https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors
