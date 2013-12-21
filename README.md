Stellaris Dev Box
=================

Development environment for working on Stellaris Launchpad with gcc-arm-embedded toolchain.


Requirements
============

* [VirtualBox](https://www.virtualbox.org)

* [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)

* [Vagrant](http://vagrantup.com)


Installation
============

Set up the virtual machine:

    $ git clone https://github.com/deanrock/stellaris-dev-box.git
    $ cd stellaris-dev-box
    $ vagrant up

Download SW-EK-LM4F120XL-9453.exe from [http://www.ti.com/tool/sw-ek-lm4f120xl](http://www.ti.com/tool/sw-ek-lm4f120xl) and copy it to /path/to/stellaris-dev-box/.

SSH into machine:
    
    $ vagrant ssh

Install required packages:

    vagrant@stellaris-dev-box$ ./files/bootstrap.sh


Try it
======

You can compile and flash example project located in ~/files/example-project to test the installation.

* Connect your Stellaris Launchpad to your computer
* Run following commands via ssh:

		vagrant@stellaris-dev-box$ cd ~/files/example-project
		vagrant@stellaris-dev-box$ make
		vagrant@stellaris-dev-box$ make flash


