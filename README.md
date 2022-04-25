# __USB Keyboard Driver__
In this project, two new modes to operate the CAPSLOCK and NUMLOCK are introduced in the Linux USB Keyboad driver `usbkbd.c`

--------------------
### __A. Operation modes__
 
#### __Mode 1:__

This mode operates the keyboard with the default behavior of the driver.

#### __Mode 2:__

If CAPSLOCK is off and NUMLOCK is pressed then this `MODE_2` get activated, upon `MODE_2` activation the CAPSLOCK led is turned on automatically. When this mode is activated the CAPSLOCK operates with the opposite of its default behavior.

------
### __B. Project structure__
* __usbkbd.c__	 - A modified version of the `usbkbd` implementing the new two modes.
* __usbKeyboard.sh__  - Script for unbinding the default keyboard driver `usbhid` and binding the new keyboard driver `usbkbd`.
* __Makefile__	 - Rules to compile the driver.

--------------------
### __C. Running the module__

Copy the files usbkbd.c, Makefile and usbKeyboard.sh to a virtual linux machine
and follow the below steps:

1. Start the linux VM

2. Run Makefile rule to compile the module:
	```
	$ make
	```
3. Module loading:
	```
	$ sudo insmod usbkbd.ko
	```
4. Connect the USB Keyboard and grant control to the VM.

5. The control of the keyboard is redirected from `usbhid` to `usbkbd` driver by running:
	```
	$ ./unbind_bind.sh
	```
6. Test cases:
	* `MODE_1` active:
	   - `CAPSLOCK` not pressed   --> `CAPSLOCK LED` turns `OFF`::  ==> Lowercase
	   - `CAPSLOCK` is pressed    --> `CPASLOCK LED` turns `ON`::  ==> Uppercase
	
	* In `MODE_2` active:
	   - The initial behavior in `MODE_2`: `CAPSLOCK` not pressed => `CAPSLOCK LED ON`, `NUMLOCK LED ON`:: ==> Lowercase
	   - `CAPSLOCK` is pressed --> `CAPSLOCK LED OFF`, `NUMLOCK LED ON`:: ==> Uppercase
	* From `MODE_1` to `MODE_2`:
		- Press `NUMLCOK` with `CAPSLOCK OFF`
	* From `MODE_2` to `MODE_1`
	   - When `CAPSLOCK` is not pressed and `NUMLOCK` is pressed, both `CAPSLOCK` and `NUMLOCK` LEDs will be `OFF`:: ==> Lowercase
	   - When `CAPSLOCK` is pressed     => `NUMLOCK` is pressed, `CAPSLOCK LED` turns `ON`, `NUMLOCK LED` turns `OFF`:: ==> Uppercase

7. Unload module :
	```
	$ sudo rmmod usbkbd
	```