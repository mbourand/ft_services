if [ $(ps | head -n -2 | grep "telegraf" | wc -l) -lt 1 ]; then
	exit 1
else
	exit 0
fi
