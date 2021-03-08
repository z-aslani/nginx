#!/bin/bash

if [ "$CONFIG_MODE" = "mirror" ]; then
  sed -e 's/\(.*\)#Mirroring\(.*\)/\1\2/g' -i /etc/nginx/sites-enabled/*;
fi

