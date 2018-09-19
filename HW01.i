# 1 "HW01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HW01.c"
# 28 "HW01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int, unsigned short);
void drawRectangle(int, int, int, int, unsigned short);
void drawBorder();
void drain1();
void drain2();
void drain3();

void charge1();
void charge2();
void charge3();

void delay(int);



unsigned short *videoBuffer = (unsigned short *)0x6000000;
int chargespeed = 20;


volatile unsigned short* scanlineCounter = (unsigned short*) 0x04000006;

void waitForVBlank() {
    while (*scanlineCounter >= 160);
    while (*scanlineCounter < 160);
}


int main() {
    (*(unsigned short *)0x4000000) = 3 | (1<<10);

    drawBorder();
    while(1) {
        drain1();
        drain2();
        drain3();

        charge1();
        charge2();
        charge3();


    }

    return 0;
}

void setPixel(int row, int col, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRectangle(int row, int col, int length, int width, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < length; j++) {
            setPixel((row + i), (col + j), color);
        }
    }
}

void drawBorder() {
    drawRectangle(54, 69, 87, 2, ((31) | (31)<<5 | (31)<<10));
    drawRectangle(54, 69, 2, 47, ((31) | (31)<<5 | (31)<<10));
    drawRectangle(100, 69, 87, 2, ((31) | (31)<<5 | (31)<<10));
    drawRectangle(54, 154, 2, 47, ((31) | (31)<<5 | (31)<<10));
    drawRectangle(68, 154, 6, 16, ((31) | (31)<<5 | (31)<<10));
}


void drain1() {
    for (int i = 0; i < 38; i++) {

        drawRectangle(60, 75, (75 - i), 35, ((0) | (25)<<5 | (11)<<10));
        drawRectangle(60, 75, (75 - i), 8, ((0) | (28)<<5 | (13)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }
}

void drain2() {
    for (int i = 0; i < 18; i++) {

        drawRectangle(60, 75, (37 - i), 35, ((31) | (20)<<5 | (0)<<10));
        drawRectangle(60, 75, (37 - i), 8, ((31) | (25)<<5 | (4)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }
}

void drain3() {
    for (int i = 0; i < 18; i++) {

        drawRectangle(60, 75, (19 - i), 35, ((29) | (0)<<5 | (0)<<10));
        drawRectangle(60, 75, (19 - i), 8, ((29) | (10)<<5 | (10)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }

    drawRectangle(60, 75, 1, 35, ((29) | (0)<<5 | (0)<<10));
    drawRectangle(60, 75, 1, 8, ((29) | (10)<<5 | (10)<<10));
    delay(150);

}


void charge1() {
    for (int i = 1; i < 18; i++) {

        drawRectangle(60, 75, (0 + i), 35, ((29) | (0)<<5 | (0)<<10));
        drawRectangle(60, 75, (0 + i), 8, ((29) | (10)<<5 | (10)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }
}

void charge2() {
    for (int i = 0; i < 18; i++) {

        drawRectangle(60, 75, (20 + i), 35, ((31) | (20)<<5 | (0)<<10));
        drawRectangle(60, 75, (20 + i), 8, ((31) | (25)<<5 | (4)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }
}

void charge3() {
    for (int i = 0; i < 38; i++) {

        drawRectangle(60, 75, (38 + i), 35, ((0) | (25)<<5 | (11)<<10));
        drawRectangle(60, 75, (38 + i), 8, ((0) | (28)<<5 | (13)<<10));
        delay(chargespeed);

        waitForVBlank();


        drawRectangle(60, 75, 75, 35, 0);
    }

    drawRectangle(60, 75, 75, 35, ((0) | (25)<<5 | (11)<<10));
    drawRectangle(60, 75, 75, 8, ((0) | (28)<<5 | (13)<<10));
    delay(150);
}
