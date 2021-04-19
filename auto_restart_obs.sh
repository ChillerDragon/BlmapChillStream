#!/bin/bash

RESTART_HOUR=00

function log() {
        printf "[%s] %s\\n" "$(date '+%F')" "$1"
}

has_restarted=0
while true;
do
        if [ "$(date '+%H')" == "$RESTART_HOUR" ]
        then
                if [ "$has_restarted" == "0" ]
                then
                        obs_pid="$(pgrep obs)"
                        if [ "$obs_pid" == "" ]
                        then
                                log "obs is not running."
                        else
                                log "killing obs ..."
                                kill "$(pgrep obs)"
                        fi
                fi
                has_restarted=1
        else
                has_restarted=0
        fi
        sleep 1
done

