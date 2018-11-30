#! /bin/sh

DOT_FILES=( .vimrc .dein.vim  )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dein-vim/$file $HOME/$file
done

[ ! -d $HOME/.vim ] && mkdir -p $HOME/.vim && ln -s $HOME/dein-vim/dein $HOME/.vim
