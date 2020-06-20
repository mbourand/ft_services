if [ $(ps | head -n -2 | grep "telegraf" | wc -l) -lt 1 ] || [$(ps | head -n -2 | grep "mysql" | wc -l) -lt 2]; then
	exit 1
else
	exit 0
fi
