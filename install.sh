#!/bin/bash

set -u

#実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."

for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue
  [ "$f" = ".require_oh-my-zsh" ] && continue
  [ "$f" = ".gitmodules" ] && continue

  ln -snfv ~/dotfiles/"$f" ~/
done

ln -snfv ~/dotfiles/.vim ~/.vim
ln -snfv ~/dotfiles/.gitconfig ~/.gitcofig
ln -snfv ~/dotfiles/.cheatsheat.md ~/.cheatsheat.md
ln -snfv ~/dotfiles/.dircolors ~/.dircolors

echo "vim plugin setup..."

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

cat << END

dotfiles setup is finish.

END
