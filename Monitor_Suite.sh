#!/bin/bash

# Banner
echo "██╗    ██╗██╗███████╗██╗      ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗       ██████╗ ███████╗███████╗████████╗ █████╗ ██████╗ ████████╗"
echo "██║    ██║██║██╔════╝██║      ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗      ██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝"
echo "██║ █╗ ██║██║█████╗  ██║█████╗██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝█████╗██████╔╝█████╗  ███████╗   ██║   ███████║██████╔╝   ██║   "
echo "██║███╗██║██║██╔══╝  ██║╚════╝██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗╚════╝██╔══██╗██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   "
echo "╚███╔███╔╝██║██║     ██║      ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║      ██║  ██║███████╗███████║   ██║   ██║  ██║██║  ██║   ██║   "
echo " ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝      ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝      ╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   "
echo "                                                                                                                                                          "
echo "                           Monitor Mode Control Script                            "
echo "                                  Created By N3XU$-3E1NG                              "

# Take user input for interface name
echo -n "Enter the wireless interface name (can check with "iwconfig" command): "
read interface_name

echo "1. Enable Monitor Mode"
echo "2. Disable Monitor Mode"
echo "3. Restart Network"
echo -n "Select an option (1/2/3): "
read choice

case $choice in
    1)
        # Enable Monitor Mode
        sudo ifconfig $interface_name down
        sudo airmon-ng check kill
        sudo airmon-ng start $interface_name
        sudo ifconfig $interface_name up
        echo "Sucessfully Enabled Monior Mode"
        iwconfig
        ;;
    2)
        # Disable Monitor Mode
        sudo ifconfig $interface_name down
        sudo airmon-ng stop $interface_name
        sudo ifconfig $interface_name up
        echo "Sucessfully Disabled Monior Mode"
        iwconfig
        ;;
    3)
        # Restart Network
        sudo service networking start
        sudo service NetworkManager start
        echo "Networking Services are Up"
        ;;
    *)
        echo "Invalid option. Please select 1, 2, or 3."
        ;;
esac
