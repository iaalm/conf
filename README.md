# conf
My configure file


## Setup

### WSL
```bash
curl https://raw.githubusercontent.com/iaalm/conf/main/wsl.sh | bash
```

### Windows
```shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/iaalm/conf/main/windows.ps1'))
```
