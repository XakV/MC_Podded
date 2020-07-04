#!/bin/bash

function run_bear() {
  /usr/bin/podman run -dt --pod oakenkraft -i --name=paper_bear \
   --mount type=bind,src=/srv/bear,dst=/srv \
   bear-21 java -jar -Xms1024M -Xmx2048M \
   /srv/paper-21.jar nogui
}

function run_duck() {
  /usr/bin/podman run -dt --pod oakenkraft -i --name=paper_duck \
   --mount type=bind,src=/srv/duck,dst=/srv \
   duck-21 java -jar -Xms1024M -Xmx1024M \
   /srv/paper-21.jar nogui
}

function run_goat() {
  /usr/bin/podman run -dt --pod oakenkraft -i --name=paper_goat \
   --mount type=bind,src=/srv/goat,dst=/srv goat-21 \
   java -jar -Xms1024M -Xmx2048M /srv/paper-21.jar nogui
}

function run_water() {
  /usr/bin/podman run -dt --pod new:oakenkraft -p 25565-25569:25565-25568/tcp -i --name=waterfall \
   --mount type=bind,src=/srv/waterfall,dst=/srv waterfall-358 \
   java -jar -Xms256M -Xmx512M /srv/waterfall-358.jar nogui
   
}

function get_pod_states() {
  bState=$(/usr/bin/podman ps -a | grep bear)
  dState=$(/usr/bin/podman ps -a | grep duck)
  gState=$(/usr/bin/podman ps -a | grep goat)
  wState=$(/usr/bin/podman ps -a | grep water)
}

function main() {
  get_pod_states
  [ -z $wState ] || run_water
  [ -z $wState ] || run_bear
  [ -z $wState ] || run_duck
  [ -z $wState ] || run_goat
}

main
