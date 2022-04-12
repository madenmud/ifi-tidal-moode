# Tidal connect service raspberry/ARM based on ppy2/ifi-tidal-release

The repository includes dynamic libraries which were scraped from debian packages to facilitate the installation process.
The application has been tested on Moode audio OS, but it should also work on other distros.

## Test run
1. SSH to rPI:
``` 
ssh pi@moode.local
```

2. Download and unzip repository content:
```
wget -c "https://github.com/vcucek/ifi-tidal-moode/archive/refs/heads/master.zip" -O - | busybox unzip -
```

2.1 Download and install libssl1.0.0

```
pi@moode:~/libs $ wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_armhf.deb
--2022-04-13 00:11:06--  http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_armhf.deb
Resolving ftp.debian.org (ftp.debian.org)... 146.75.50.132, 2a04:4e42:7c::644
Connecting to ftp.debian.org (ftp.debian.org)|146.75.50.132|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 867762 (847K) [application/x-debian-package]
Saving to: ‘libssl1.0.0_1.0.1t-1+deb8u8_armhf.deb’

libssl1.0.0_1.0.1t-1+deb8u8_a 100%[=================================================>] 847.42K  --.-KB/s    in 0.07s

2022-04-13 00:11:06 (11.1 MB/s) - ‘libssl1.0.0_1.0.1t-1+deb8u8_armhf.deb’ saved [867762/867762]

pi@moode:~/libs $ sudo dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_armhf.deb
```

3. Navigate to folder:
```
cd ifi-tidal-moode-master
```

3. Configure playback audio device:
```
make
```

4. Run Tidal connect as sudo. For some reason the application is unable to open ALSA device stream as a reguar user.
```
sudo ./start.sh
```

## Install (run application as a service)
1. Configure playback output device:
```
sudo make
```
3. Copy repository content to the "/opt/tidal-connect" folder, configure systemd unit and start a Tidal connect service:
```
sudo make install
```

## TODO:
Remove duplicated libraries from 'lib' folder.
