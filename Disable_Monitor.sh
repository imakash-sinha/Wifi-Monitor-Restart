#/bin/bash
sudo ifconfig wlan0 down
sudo airmon-ng stop wlan0 
sudo ifconfig wlan0 up
iwconfig