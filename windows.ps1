# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y python311 vim-x64 make jq ripgrep universal-ctags 7zip azcopy ARMClient azure-cli AzureStorageExplorer Everything dejavufonts duplicacy nuget.commandline windows-performance-toolkit perfview docker-desktop GoogleChrome nerd-fonts-SourceCodePro logseq gpg4win
iwr https://raw.githubusercontent.com/iaalm/conf/main/.vimrc -OutFile ~/_vimrc
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
echo "set guifont=SauceCodePro_NFM:h12:cANSI:qDRAFT" > ~/_gvimrc
