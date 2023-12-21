# xtermjs-docker

https://github.com/xtermjs/xterm.js
https://github.com/tsl0922/ttyd


## Installation

```bash
curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.4/ttyd.i686 -o /usr/bin/ttyd && \
    chmod +x /usr/bin/ttyd

#img2sixel
sudo apt update && sudo apt install -y libsixel-bin 

#trzsz
sudo apt update && sudo apt install software-properties-common
sudo add-apt-repository ppa:trzsz/ppa && sudo apt update
sudo apt install trzsz

ttyd -W --interface hnet0 --ipv6 --port 8081 -t enableSixel=true -t enableTrzsz=true bash
```

## Systemd

Create `/etc/systemd/system/ttyd.service` with the following content:

```
[Unit]
Description=TTYD
After=syslog.target
After=network.target

[Service]
ExecStart=/usr/bin/ttyd -W --interface hnet0 --ipv6 --port 8081 --cwd /home/husarion -t enableSixel=true -t enableTrzsz=true bash
Type=simple
Restart=always
User=husarion
Group=husarion

[Install]
WantedBy=multi-user.target
```

Activate with:

```bash
sudo systemctl start ttyd && sudo systemctl enable ttyd
```
## Using

Potem wbijamy w przeglądarce na http://rosbot2r:8081:

1. Aby wyświetlić grafikę:

```
cd rosbot-autonomy/maps/
img2sixel map.png
```

2. Aby przekopiować plik: drag&drop

