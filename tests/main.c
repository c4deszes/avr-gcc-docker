#include <avr/io.h>

int main(void) {
    PORTA.DIRSET = _BV(0);

    while(1) {
        PORTA.OUTSET = _BV(0);
        PORTA.OUTCLR = _BV(0);
    }
}
