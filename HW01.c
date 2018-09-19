// GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))


//Animation Colors
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

#define GREEN COLOR(0, 25, 11)
#define GREENLIGHTER COLOR(0, 28, 13)

#define ORANGE COLOR(31, 20, 0)
#define ORANGELIGHTER COLOR(31, 25, 4)

#define RED COLOR(29, 0, 0)
#define REDLIGHTER COLOR(29, 10, 10)


// Function Prototypes
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


// Global Variables
unsigned short *videoBuffer = (unsigned short *)0x6000000;
int chargespeed = 20;

// scanlineCounter stores the current row being drawn// 0-159 is onscreen, 160-227 is the vertical blank
volatile unsigned short* scanlineCounter = (unsigned short*) 0x04000006;

void waitForVBlank() {
    while (*scanlineCounter >= 160);  // stall until current VBlank ends
    while (*scanlineCounter < 160);   // stall until next VBlank begins
}


int main() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    // int time = 0;
    drawBorder();
    while(1) {
        drain1();
        drain2();
        drain3();

        charge1();
        charge2();
        charge3();

        // time++;
    }

    return 0;
}

void setPixel(int row, int col, unsigned short color) {
    videoBuffer[OFFSET(row, col, 240)] = color;
}

void drawRectangle(int row, int col, int length, int width, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < length; j++) {
            setPixel((row + i), (col + j), color);
        }
    }
}

void drawBorder() {
    drawRectangle(54, 69, 87, 2, WHITE);
    drawRectangle(54, 69, 2, 47, WHITE);
    drawRectangle(100, 69, 87, 2, WHITE);
    drawRectangle(54, 154, 2, 47, WHITE);
    drawRectangle(68, 154, 6, 16, WHITE);
}

//decreasing
void drain1() {
    for (int i = 0; i < 38; i++) {
        //draw fill
        drawRectangle(60, 75, (75 - i), 35, GREEN);
        drawRectangle(60, 75, (75 - i), 8, GREENLIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }
}

void drain2() {
    for (int i = 0; i < 18; i++) {
        //draw fill
        drawRectangle(60, 75, (37 - i), 35, ORANGE);
        drawRectangle(60, 75, (37 - i), 8, ORANGELIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }
}

void drain3() {
    for (int i = 0; i < 18; i++) {
        //draw fill
        drawRectangle(60, 75, (19 - i), 35, RED);
        drawRectangle(60, 75, (19 - i), 8, REDLIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }

    drawRectangle(60, 75, 1, 35, RED);
    drawRectangle(60, 75, 1, 8, REDLIGHTER);
    delay(150);

}

//increasing
void charge1() {
    for (int i = 1; i < 18; i++) {
        //draw fill
        drawRectangle(60, 75, (0 + i), 35, RED);
        drawRectangle(60, 75, (0 + i), 8, REDLIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }
}

void charge2() {
    for (int i = 0; i < 18; i++) {
        //draw fill
        drawRectangle(60, 75, (20 + i), 35, ORANGE);
        drawRectangle(60, 75, (20 + i), 8, ORANGELIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }
}

void charge3() {
    for (int i = 0; i < 38; i++) {
        //draw fill
        drawRectangle(60, 75, (38 + i), 35, GREEN);
        drawRectangle(60, 75, (38 + i), 8, GREENLIGHTER);
        delay(chargespeed);

        waitForVBlank();

        //erase
        drawRectangle(60, 75, 75, 35, BLACK);
    }

    drawRectangle(60, 75, 75, 35, GREEN);
    drawRectangle(60, 75, 75, 8, GREENLIGHTER);
    delay(150);
}