#Add PPA for gnu arm embedded toolchain
sudo apt-get update
sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:terry.guo/gcc-arm-embedded
sudo apt-get update

#Install packages
sudo apt-get -y install flex bison libgmp3-dev libmpfr-dev libncurses5-dev \
    libmpc-dev autoconf texinfo build-essential libftdi-dev git python-yaml \
    unzip pkg-config libusb-1.0-0-dev gcc-arm-none-eabi


#get summon-arm-toolchain

#if hash arm-none-eabi-gcc 2>/dev/null; then
#	echo "SAT already installed!"
#else
#	cd ~/
#	git clone https://github.com/esden/summon-arm-toolchain
#	cd summon-arm-toolchain
#	./summon-arm-toolchain
#
#	echo "export PATH=$PATH:~/sat/bin/" >> ~/.profile
#fi


if hash lm4flash 2>/dev/null; then
	echo "lm4flash already installed!"
else
	#get lm4tools
	cd ~
	git clone https://github.com/utzig/lm4tools.git
	cd lm4tools/lm4flash; make

	#set paths
	echo "export PATH=$PATH:~/lm4tools/lm4flash/" >> ~/.profile
fi

rm -r ~/stellarisware/
mkdir ~/stellarisware/
cp ~/files/SW-EK-LM4F120XL-9453.exe ~/stellarisware/
cd ~/stellarisware/
unzip SW-EK-LM4F120XL-9453.exe

