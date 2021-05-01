# Tidal connect service raspberry/ARM based on ppy2/ifi-tidal-release

The repository includes dynamic libraries which were scraped from debian packages to facilitate the installation process.
The application has been tested on Moode audio OS, but it should also work on other distros.

## Test run
1. Clone/copy repository to rPI running Moode audio OS.
2. SSH to rPI and navigate to the folder containing repository files.
3. Set start script permissions with ``` chmod +x start.sh ```
4. Run Tidal connect with ```sudo ./start.sh ``` - for some reason the application is unable to open ALSA device stream as a reguar user.

### Configure playback device
Most probably your playback device name differes from preconfigured in 'start.sh' script (USB Audio: - (hw:2,0)).
Check start script output log which lists available playback devices. Find desired device name and copy/paste it to the "start.sh".
Run ``` ./start.sh ``` script again and check if playback is working.

## Install (run application as service)
1. SSH to rPI and navigate to the folder containing repository files.
2. Run ```make install```, which should copy current folder content to the "/opt/tidal-connect" folder, configure systemd unit and start a Tidal connect service.
