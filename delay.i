# 1 "delay.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "delay.c"
void delay(int amount) {
    volatile int trash = 0;
    for (int i = 0; i < 1000*amount; i++) {
        trash++;
    }
}
