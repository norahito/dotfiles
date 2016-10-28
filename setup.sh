#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc

<< comment
gitのbranchを表示する
contrib/completion at master from git/git - GitHub
上記からgit-completion.bashを落としてきて、/usr/local/git/contrib/completion/に配置する。
$ mkdir -p /usr/local/git/contrib/completion/
$ mv git-completion.bash /usr/local/git/contrib/completion/
Homebrewでgitをinstallした場合は、git-completion.bashが下記の場所にあるのでこれをコピーする。
/usr/local/Cellar/git/1.7.4.2/etc/bash_completion.d/git-completion.bash
comment
