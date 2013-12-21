PREFIX_ARM = arm-none-eabi

CC = ${PREFIX_ARM}-gcc
LD = ${PREFIX_ARM}-ld
CP = ${PREFIX_ARM}-objcopy
OD = ${PREFIX_ARM}-objdump

STELLARISWARE = /home/${USER}/stellarisware

PROJECT_NAME = main

SRC = $(wildcard *.c)
OBJS = $(SRC:.c=.o)

all: required_files $(OBJS) ${PROJECT_NAME}

required_files:
	cp ~/stellarisware/boards/ek-lm4f120xl/blinky/blinky.ld blink.ld
	cp ~/stellarisware/boards/ek-lm4f120xl/blinky/startup_gcc.c .

%.o: %.c
	$(CC) ${<} -g -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -c -I${STELLARISWARE}  -DTARGET_IS_BLIZZARD_RA1  -o ${@}

${PROJECT_NAME}:
	$(LD) -T blink.ld --entry ResetISR -o a.out $(OBJS) --gc-sections

	$(CP) -O binary a.out ${PROJECT_NAME}.bin

clean:
	rm *.bin *.o *.d a.out

flash:
	sudo ~/lm4tools/lm4flash/lm4flash ${PROJECT_NAME}.bin
