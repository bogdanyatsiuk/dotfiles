# Neovim Plugins
# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Git
## Diff so fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" && \
git config --global interactive.diffFilter "diff-so-fancy --patch" && \
git config --global color.ui true && \
git config --global color.diff-highlight.oldNormal    "red bold" && \
git config --global color.diff-highlight.oldHighlight "red bold 52" && \
git config --global color.diff-highlight.newNormal    "green bold" && \
git config --global color.diff-highlight.newHighlight "green bold 22" && \
git config --global color.diff.meta       "11" && \
git config --global color.diff.frag       "magenta bold" && \
git config --global color.diff.func       "146 bold" && \
git config --global color.diff.commit     "yellow bold" && \
git config --global color.diff.old        "red bold" && \
git config --global color.diff.new        "green bold" && \
git config --global color.diff.whitespace "red reverse"

# Alacritty
# # Clone
# git clone https://github.com/alacritty/alacritty.git
# cd alacritty
# # Manual Page
# sudo mkdir -p /usr/local/share/man/man1
# gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
# # Zsh completions
# mkdir -p ${ZDOTDIR:-~}/.zsh_functions
# echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
# # Terminfo
# sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
# # Remove
# cd ..
# rm -rf alacritty

# https://github.com/tmcdonell/config-alacritty/blob/master/alacritty.yml


# Vim layout swiftcher
# git clone https://github.com/myshov/xkbswitch-macosx.git
# cp ./xkbswitch-macosx/bin/xkbswitch /usr/local/bin
# rm -rf xkbswitch-macosx
# git clone https://github.com/myshov/libxkbswitch-macosx.git
# cp ./libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/bin
# rm -rf libxkbswitch-macosx
# git clone https://github.com/lyokha/vim-xkbswitch
# mkdir -p ~/.vim/after && cp ./vim-xkbswitch/plugin/xkbswitch.vim  ~/.vim/after/
# rm -rf vim-xkbswitch
