#!/bin/bash
count=2; #Spam counter!
url="http://example.com/iplogger.php" #The logger page can be entered here.
useragent="Flooding-Tool/3.0.1 (GitHub.com/SossenSystems/Simple-cURL-Flooder; HackOS; Lindows x86_64; rv:52.4)" #The user agent can be defined here
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m'
if [[ $1 == 'start' ]]; then
	if apt -qq list curl 2>/dev/null | grep -q installed ; then
		echo -e "Command not found! Install? (y/n) \c"
		read
		if "$REPLY" = "y"; then
			sudo apt-get install curl
		else
			printf "${RED}cURL installer aborted!${NC}\n"
	   	fi
	else
		printf "${RED}Start flooding...${NC}\n"
		for ((i=0; i < count; i++)) ; do
			curl --silent --output /dev/null -A "$useragent" $url > /dev/null
		done
		printf "${GREEN}Flooding has been finished!${NC}\n"
	fi
else
	printf "${RED}Start it with 'start'!${NC}\n"
fi
