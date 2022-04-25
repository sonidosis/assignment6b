obj-m := usbkbd.o

KDIR = /usr/src/linux-headers-$(shell uname -r)

all:
	sudo $(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd)

clean:
	rm -rf *.o *.ko *.mod.* *.symvers *.order *~
