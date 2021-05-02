# Tidal connect service raspberry/ARM based on ppy2/ifi-tidal-release

The repository includes dynamic libraries which were scraped from debian packages to facilitate the installation process.
The application has been tested on Moode audio OS, but it should also work on other distros.

## Test run
1. SSH to rPI:
``` ssh pi@moode.local ```
2. Download repository content and navigate to folder:
```
wget -c "https://github.com/vcucek/ifi-tidal-moode/archive/refs/heads/master.zip" -O - | busybox unzip -
cd ifi-tidal-moode-master
```
3. Configure playback audio device:
``` make ```
4. Run Tidal connect as sudo. For some reason the application is unable to open ALSA device stream as a reguar user.
```sudo ./start.sh ```

## Install (run application as a service)
Run ```sudo make install```, which should copy current folder content to the "/opt/tidal-connect" folder, configure systemd unit and start a Tidal connect service.

## TODO:
Remove duplicated libraries from 'lib' folder.
