void delay(int amount) {
    volatile int trash = 0;
    for (int i = 0; i < 1000*amount; i++) {
        trash++;
    }
}