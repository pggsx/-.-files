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
ln -sf  ~/.bashrc ~/github/dev_lunchbox/Linux/bash/bashrc-link
ln -sf  ~/.vimrc ~/github/dev_lunchbox/Linux/vim/vimrc-link
ln -sf  ~/.tmux.conf ~/github/dev_lunchbox/Linux/tmux-link

