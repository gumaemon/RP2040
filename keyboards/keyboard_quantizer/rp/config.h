#ifndef CONFIG_H
#define CONFIG_H

#include "config_common.h"

/* Keyboard Matrix */
#define MATRIX_ROWS 2
#define MATRIX_COLS 4
#define MATRIX_ROW_PINS { GP0, GP1 }
#define MATRIX_COL_PINS { GP2, GP3, GP4, GP5 }

/* Debounce */
#define DEBOUNCE 5

/* USB */
#define VENDOR_ID 0x1234
#define PRODUCT_ID 0x5678
#define DEVICE_VER 0x0001
#define MANUFACTURER "keyboard_quantizer"
#define PRODUCT "RP2040 Keyboard Quantizer"

/* LED */
#define LED_PIN GP25

#endif
