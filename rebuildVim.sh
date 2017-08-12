sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
 
sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

sudo rm -rf /usr/local/share/vim

sudo rm /usr/bin/vim
 
sudo mkdir /usr/include/lua5.1/include
sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

cd /opt/
git clone https://github.com/vim/vim
git pull && git fetch
cd vim/src
make distclean # if vim was prev installed
./configure --prefix=installer_dir \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope
	    
make
# in LinuxMint --prefix doesnot work somehow. 
make install DESTDIR=installer_dir

# setup the alias, PATH, and Vim environment $VIM/$VIMRUNTIMEPATH
# alias vi="vim" in .zshrc / .bashrc
# export PATH=$PATH:vim_path
# export VIM=$installer_dir/local/share/...
