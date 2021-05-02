#!/bin/bash

export LD_LIBRARY_PATH=$PWD/lib

#DEVICES=$(./select-device.sh | sed "s/Valid devices are: //")
DEVICES=$(bin/tidal_connect_application \
		--tc-certificate-path "./id_certificate/IfiAudio_ZenStream.dat" \
		--netif-for-deviceid eth0 \
		-f "Moode Streamer" \
		--codec-mpegh true \
		--codec-mqa true \
		--model-name "iFi Streamer" \
		--disable-app-security false \
		--disable-web-security false \
		--enable-mqa-passthrough false \
		--playback-device "<device>" \
		--log-level 4 2>&1 | grep "Valid" -m 1 --line-buffered | sed "s/Valid devices are: //")
#read -r -a DEVICES_ARRAY <<< "$DEVICES"
eval "DEVICES_ARRAY=($DEVICES)"

PS3='Please select playback device: '
select SELECTED_DEVICE in "${DEVICES_ARRAY[@]}"
do
	sed -i "s/^DEVICE=.*/DEVICE=\"$SELECTED_DEVICE\"/" ./start.sh
	break
done
