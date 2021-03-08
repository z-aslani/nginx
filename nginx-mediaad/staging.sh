#!/bin/bash

if [ "$CONFIG_MODE" = "staging" ]; then
  sed -e 's/\(.*\)digiad:\(.*\)/\1stg-digiad:\2/g' -i /etc/nginx/sites-enabled/upstreams.conf;
fi