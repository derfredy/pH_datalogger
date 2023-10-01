#!/bin/bash

while true
do
	clear
	echo "Press [CTRL+C] to stop.."

	DATA=$(/usr/local/bin/websocat -t -E ws://192.168.5.241/ws --max-messages-rev 2 | grep PH_DATA)

	if [ $? ]; then

		rawPH=$(echo $DATA | jq .isPH)
		PH=$(echo "scale=1; $rawPH/10" | bc)
		VALVE=$(echo $DATA | jq .valveIsActive)
		DATE=$(date '+%d/%m/%Y %H:%M:%S')
		
		echo "$DATE,$PH,$VALVE" >> ph_data.csv
		echo "Current pH = $PH"

	fi

	sleep 10

done
