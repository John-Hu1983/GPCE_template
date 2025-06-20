#ifndef _USR_CONFIG_H_
#define _USR_CONFIG_H_

/*
========================system================================
*/
#define WATCH_DOG_ENABLE          (1)
#define ADC_TRIGGER_BY_TIM        (0)

/*
========================shell log=============================
*/
#define SHELL_LOG_EN              (0)


/*
========================spi dma================================
*/
#define SPI_DMA_EN                (1)


/*
========================voice==================================
*/
#define A1800_OPEN                (1)   // forbidden or not
#define VOLUME_A1800              (5)   // maximum :15
#define A1800_EVENT               (0)
#define A1800_DMA_EN              (1)  

#define A3400_OPEN                (0)   // forbidden or not
#define VOLUME_A3400              (10)  // maximum :15
#define A3400_EVENT               (0)  
#define A3400_DMA_EN              (0)  

#define MIDI_OPEN                 (0)

#define VOICE_COMPRESS            (12)  // maximum : 25

#endif
