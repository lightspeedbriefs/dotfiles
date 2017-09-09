#!/bin/bash

dir=~/dotfiles                              # dotfiles directory
olddir=~/dotfiles_old                       # old dotfiles backup directory
nvim_plug="$HOME/.local/share/nvim/site/autoload/plug.vim"
vim_plug_dir="$HOME/.vim/autoload"
# list of files/folders to symlink in homedir
files="bashrc vimrc gitconfig minttyrc gdbinit colorgccrc color_coded clang_complete ycm_extra_conf.py zshenv zshrc"

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

file=~/.gdbinit
[[ -s $file ]] && 'mv' -b $file ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
'curl' -fLo $file https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit

file=~/.gdbinit.d/colors.gdb
'curl' -fLo $file --create-dirs https://raw.githubusercontent.com/RAttab/dotfiles/master/colors.gdb
