#!/bin/sh
while true
do
  clear
  echo -n "Live:   "
  curl https://hello.k3d.local.profitbricks.net/ ; echo
  echo -n "Canary: "
  curl https://hello-canary.k3d.local.profitbricks.net/ ; echo
  echo -n "Stable: "
  curl https://hello-stable.k3d.local.profitbricks.net/ ; echo
  echo "-----------"
  sleep 1
done
