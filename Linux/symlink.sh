#!/bin/bash - 
#===============================================================================
#
#          FILE: symlink.sh
# 
#         USAGE: ./symlink.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: pggsx, 
#  ORGANIZATION: 
#       CREATED: 01/06/2016 01:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#establishes symlink after gitcleanup.sh has been run
ln -sf  ~/.bashrc /bash/bashrc-link
ln -sf  ~/.vimrc vim/vimrc-link
ln -sf  ~/.tmux.conf tmux-link
ln -sf  ~/.tmuxline.conf tmuxline-link
