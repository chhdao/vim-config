
# 复制配置文件
cp ~/.vimrc ~/.vimrc_Backup
cp ./.vimrc ~/.vimrc

# 安装Vundle
git clone https://hub.fastgit.org/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 安装nerdtree
git clone https://hub.fastgit.org/preservim/nerdtree.git ~/.vim/bundle/nerdtree

#安装ultisnips
git clone https://hub.fastgit.org/SirVer/ultisnips.git ~/.vim/bundle/ultisnips
git clone https://hub.fastgit.org/honza/vim-snippets.git ~/.vim/bundle/vim-snippets

#安装vim-colors-solarized
git clone https://hub.fastgit.org/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

#安装ale
git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale


#安装代码片段
mkdir -p ~/.vim/UltiSnips/
cp ./c++.snippets ~/.vim/UltiSnips/c++.snippets

echo "Install Ok"