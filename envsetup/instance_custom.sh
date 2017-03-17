#!/bin/bash

# Custom VIM/Tmux settings for Jihong
#
# ============================================================ #

echo "Writing .vim_runtime/my_configs.vim"
wget "https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/my_configs.vim" -O ${HOME}/.vim_runtime/my_configs.vim


echo "Writing .tmux.conf"
wget "https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/tmux.conf" -O ${HOME}/.tmux.conf


echo "Adding .tmux.completion.bash to bashrc"
wget "https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/tmux.completion.bash" -O ${HOME}/.tmux.completion.bash


grep -q -F 'source ${HOME}/.tmux.completion.bash' ${HOME}/.bashrc || echo 'source ${HOME}/.tmux.completion.bash' >> ${HOME}/.bashrc
source ${HOME}/.bashrc

