#!/bin/sh

cron -f >> /var/log/cron.log &
/usr/bin/python3 /recollwebui/webui-standalone.py -a 0.0.0.0