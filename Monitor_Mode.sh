#/bin/bash
sudo ifconfig wlan0 down
sudo airmon-ng check kill
sudo airmon-ng start wlan0 
iwconfig