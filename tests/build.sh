avr-gcc -mmcu=attiny416 -c main.c -o main.o
avr-gcc -mmcu=attiny416 main.o -o app.elf
