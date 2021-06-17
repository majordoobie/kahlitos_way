# khalito_client
Small piece of code that runs on the pi to control lizard enclosure temperatures. 


# psycopg2 error
There is a dependency issue with the pi, you need to install `libpq5` as well
```bash
sudo apt install libpq5
sudo apt-get install libgpiod2
```

# Persistence
## Set up docker
```bash
sudo systemctl enable docker
```
## Set up systemd unit file
```bash
[Unit] 
Description=Kahlo FastAPI 
 
[Service] 
Type=simple 
ExecStart=/home/pi/code/khalito_client/.venv_khalito_client/bin/python /home/pi/code/khalito_client/kahlitos_way.py 
Restart=on-failure 
RestartSec=5s 
 
[Install] 
WantedBy=multi-user.target

(.venv_khalito_client) pi@khalito:~/code/khalito_client $ cat /lib/systemd/system/kahlo_daemon.service
[Unit] 
Description=Kahlo Daemon
 
[Service] 
Type=simple 
ExecStart=/home/pi/code/khalito_client/.venv_khalito_client/bin/python /home/pi/code/khalito_client/kahlo_daemon.py 
Restart=on-failure 
RestartSec=5s 
 
[Install] 
WantedBy=multi-user.target
```

Then enable them
```bash
sudo systemctl daemon-reload
sudo systemctl enable kahlo_daemon.service
sudo systemctl enable kahlo_api.service
```



- 