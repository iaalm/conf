# vim
curl -fLo ~/.vimrc --create-dirs \
    https://raw.githubusercontent.com/iaalm/conf/main/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install -y nodejs npm

# zsh
sudo apt install -y zsh
sudo chsh $USER -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# python
sudo apt install -y python3-build python3-hatchling python3-venv python3-keyring
pip install --break-system-packages  artifacts-keyring

# credential manager
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
git config --global credential.https://dev.azure.com.useHttpPath true
wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash

# docker
sudo groupadd docker
sudo gpasswd -a $USER docker
