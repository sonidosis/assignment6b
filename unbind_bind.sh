#!/bin/bash

# 2-8:2.12 can be different and found using dmesg

sudo echo -n "2-8:2.12" > /sys/bus/usb/drivers/usbhid/unbind
sudo echo -n "2-8:2.12" > /sys/bus/usb/drivers/usbkbd/bind
