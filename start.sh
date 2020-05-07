#!/usr/bin/env sh

[ -f /data/murmur.ini ] || (/bin/cp /templates/murmur.ini /data/murmur.ini && echo "Copied default config")

/usr/local/bin/murmur -fg -ini /data/murmur.ini
