;/**
; ******************************************************************************
;  @file  startup_hc32f334.s
;  @brief Startup for IAR.
; verbatim
;  Change Logs:
;  Date             Author          Notes
;  2024-01-15       CDT             First version
;  2024-06-30       CDT             Added code of clear SRAMC status flags
; endverbatim
; *****************************************************************************
; * Copyright (C) 2022-2024, Xiaohua Semiconductor Co., Ltd. All rights reserved.
; *
; * This software component is licensed by XHSC under BSD 3-Clause license
; * (the "License"); You may not use this file except in compliance with the
; * License. You may obtain a copy of the License at:
; *                    opensource.org/licenses/BSD-3-Clause
; *
; ******************************************************************************
; */


                MODULE  ?cstartup

                ;; Forward declaration of sections.
                SECTION CSTACK:DATA:NOROOT(3)

                SECTION .intvec:CODE:NOROOT(2)

                EXTERN  __iar_program_start
                EXTERN  SystemInit
                PUBLIC  __vector_table

                DATA
__vector_table
                DCD     sfe(CSTACK)               ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; Peripheral Interrupts
                DCD     IRQ000_Handler
                DCD     IRQ001_Handler
                DCD     IRQ002_Handler
                DCD     IRQ003_Handler
                DCD     IRQ004_Handler
                DCD     IRQ005_Handler
                DCD     IRQ006_Handler
                DCD     IRQ007_Handler
                DCD     IRQ008_Handler
                DCD     IRQ009_Handler
                DCD     IRQ010_Handler
                DCD     IRQ011_Handler
                DCD     IRQ012_Handler
                DCD     IRQ013_Handler
                DCD     IRQ014_Handler
                DCD     IRQ015_Handler
                DCD     EXTINT00_SWINT16_Handler
                DCD     EXTINT01_SWINT17_Handler
                DCD     EXTINT02_SWINT18_Handler
                DCD     EXTINT03_SWINT19_Handler
                DCD     EXTINT04_SWINT20_Handler
                DCD     EXTINT05_SWINT21_Handler
                DCD     EXTINT06_SWINT22_Handler
                DCD     EXTINT07_SWINT23_Handler
                DCD     EXTINT08_SWINT24_Handler
                DCD     EXTINT09_SWINT25_Handler
                DCD     EXTINT10_SWINT26_Handler
                DCD     EXTINT11_SWINT27_Handler
                DCD     EXTINT12_SWINT28_Handler
                DCD     EXTINT13_SWINT29_Handler
                DCD     EXTINT14_SWINT30_Handler
                DCD     EXTINT15_SWINT31_Handler
                DCD     DMA_Error_Handler
                DCD     DMA_TC0_BTC0_Handler
                DCD     DMA_TC1_BTC1_Handler
                DCD     DMA_TC2_BTC2_Handler
                DCD     DMA_TC3_BTC3_Handler
                DCD     DMA_TC4_BTC4_Handler
                DCD     DMA_TC5_BTC5_Handler
                DCD     DMA_TC6_BTC6_Handler
                DCD     DMA_TC7_BTC7_Handler
                DCD     EFM_PEError_ReadCol_Handler
                DCD     EFM_OpEnd_Handler
                DCD     FPU_Error_Handler
                DCD     TMR0_1_Handler
                DCD     TMR0_2_Handler
                DCD     RTC_Handler
                DCD     CLK_XtalStop_Handler
                DCD     PWC_WKTM_Handler
                DCD     SWDT_Handler
                DCD     TMR6_1_GCmp_Handler
                DCD     TMR6_1_Ovf_Udf_Handler
                DCD     TMR6_1_Dte_Handler
                DCD     TMR6_1_SCmp_Handler
                DCD     TMRA_1_Ovf_Udf_Handler
                DCD     TMRA_1_Cmp_Handler
                DCD     TMR6_2_GCmp_Handler
                DCD     TMR6_2_Ovf_Udf_Handler
                DCD     TMR6_2_Dte_Handler
                DCD     TMR6_2_SCmp_Handler
                DCD     TMRA_2_Ovf_Udf_Handler
                DCD     TMRA_2_Cmp_Handler
                DCD     TMR6_3_GCmp_Handler
                DCD     TMR6_3_Ovf_Udf_Handler
                DCD     TMR6_3_Dte_Handler
                DCD     TMR6_3_SCmp_Handler
                DCD     TMRA_3_Ovf_Udf_Handler
                DCD     TMRA_3_Cmp_Handler
                DCD     TMR6_4_GCmp_Handler
                DCD     TMR6_4_Ovf_Udf_Handler
                DCD     TMR6_4_Dte_Handler
                DCD     TMR6_4_SCmp_Handler
                DCD     TMRA_4_Ovf_Udf_Handler
                DCD     TMRA_4_Cmp_Handler
                DCD     HRPWM_1_GCmp_Handler
                DCD     HRPWM_1_Ovf_Udf_Handler
                DCD     HRPWM_1_SCmp_Handler
                DCD     HRPWM_1_GCap_Handler
                DCD     HRPWM_2_GCmp_Handler
                DCD     HRPWM_2_Ovf_Udf_Handler
                DCD     HRPWM_2_SCmp_Handler
                DCD     HRPWM_2_GCap_Handler
                DCD     HRPWM_Handler
                DCD     EMB_GR0_Handler
                DCD     EMB_GR1_Handler
                DCD     EMB_GR2_Handler
                DCD     EMB_GR3_Handler
                DCD     HRPWM_3_GCmp_Handler
                DCD     HRPWM_3_Ovf_Udf_Handler
                DCD     HRPWM_3_SCmp_Handler
                DCD     HRPWM_3_GCap_Handler
                DCD     HRPWM_4_GCmp_Handler
                DCD     HRPWM_4_Ovf_Udf_Handler
                DCD     HRPWM_4_SCmp_Handler
                DCD     HRPWM_4_GCap_Handler
                DCD     EMB_GR4_Handler
                DCD     EMB_GR5_Handler
                DCD     EMB_GR6_Handler
                DCD     EMB_GR7_Handler
                DCD     EMB_GR8_Handler
                DCD     HRPWM_5_GCmp_Handler
                DCD     HRPWM_5_Ovf_Udf_Handler
                DCD     HRPWM_5_SCmp_Handler
                DCD     HRPWM_5_GCap_Handler
                DCD     HRPWM_6_GCmp_Handler
                DCD     HRPWM_6_Ovf_Udf_Handler
                DCD     HRPWM_6_SCmp_Handler
                DCD     HRPWM_6_GCap_Handler
                DCD     MCANRAM_ECCError_Handler
                DCD     MCAN1_INT0_Handler
                DCD     MCAN1_INT1_Handler
                DCD     MCAN2_INT0_Handler
                DCD     MCAN2_INT1_Handler
                DCD     TMR4_GCmp_Handler
                DCD     TMR4_Ovf_Udf_Handler
                DCD     TMR4_Reload_Handler
                DCD     TMR4_SCmp_Handler
                DCD     CMP1_Handler
                DCD     CMP2_Handler
                DCD     CMP3_Handler
                DCD     I2C_Handler
                DCD     USART1_Handler
                DCD     USART1_TxComplete_Handler
                DCD     SPI_Handler
                DCD     TMRA_5_Ovf_Udf_Handler
                DCD     TMRA_5_Cmp_Handler
                DCD     EVENT_PORT1_Handler
                DCD     EVENT_PORT2_Handler
                DCD     EVENT_PORT3_Handler
                DCD     EVENT_PORT4_Handler
                DCD     USART2_Handler
                DCD     USART2_TxComplete_Handler
                DCD     USART3_Handler
                DCD     USART3_TxComplete_Handler
                DCD     USART4_Handler
                DCD     USART4_TxComplete_Handler
                DCD     0
                DCD     USART1_WKUP_Handler
                DCD     PWC_LVD1_Handler
                DCD     PWC_LVD2_Handler
                DCD     FCM_Handler
                DCD     WDT_Handler
                DCD     CTC_Handler
                DCD     ADC1_Handler
                DCD     ADC2_Handler
                DCD     ADC3_Handler

                THUMB
; Dummy Exception Handlers (infinite loops which can be modified)

                PUBWEAK Reset_Handler
                SECTION .text:CODE:NOROOT:REORDER(2)
Reset_Handler
;ClrSramSR
                LDR     R0, =0x40050810
                LDR     R1, =0x1F8
                STR     R1, [R0]

                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__iar_program_start
                BX      R0

                PUBWEAK NMI_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
NMI_Handler
                B       NMI_Handler

                PUBWEAK HardFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HardFault_Handler
                B       HardFault_Handler

                PUBWEAK MemManage_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MemManage_Handler
                B       MemManage_Handler

                PUBWEAK BusFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
BusFault_Handler
                B       BusFault_Handler

                PUBWEAK UsageFault_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
UsageFault_Handler
                B       UsageFault_Handler

                PUBWEAK SVC_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SVC_Handler
                B       SVC_Handler

                PUBWEAK DebugMon_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DebugMon_Handler
                B       DebugMon_Handler

                PUBWEAK PendSV_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
PendSV_Handler
                B       PendSV_Handler

                PUBWEAK SysTick_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SysTick_Handler
                B       SysTick_Handler

                PUBWEAK IRQ000_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ000_Handler
                B       IRQ000_Handler

                PUBWEAK IRQ001_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ001_Handler
                B       IRQ001_Handler

                PUBWEAK IRQ002_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ002_Handler
                B       IRQ002_Handler

                PUBWEAK IRQ003_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ003_Handler
                B       IRQ003_Handler

                PUBWEAK IRQ004_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ004_Handler
                B       IRQ004_Handler

                PUBWEAK IRQ005_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ005_Handler
                B       IRQ005_Handler

                PUBWEAK IRQ006_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ006_Handler
                B       IRQ006_Handler

                PUBWEAK IRQ007_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ007_Handler
                B       IRQ007_Handler

                PUBWEAK IRQ008_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ008_Handler
                B       IRQ008_Handler

                PUBWEAK IRQ009_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ009_Handler
                B       IRQ009_Handler

                PUBWEAK IRQ010_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ010_Handler
                B       IRQ010_Handler

                PUBWEAK IRQ011_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ011_Handler
                B       IRQ011_Handler

                PUBWEAK IRQ012_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ012_Handler
                B       IRQ012_Handler

                PUBWEAK IRQ013_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ013_Handler
                B       IRQ013_Handler

                PUBWEAK IRQ014_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ014_Handler
                B       IRQ014_Handler

                PUBWEAK IRQ015_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
IRQ015_Handler
                B       IRQ015_Handler

                PUBWEAK EXTINT00_SWINT16_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT00_SWINT16_Handler
                B       EXTINT00_SWINT16_Handler

                PUBWEAK EXTINT01_SWINT17_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT01_SWINT17_Handler
                B       EXTINT01_SWINT17_Handler

                PUBWEAK EXTINT02_SWINT18_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT02_SWINT18_Handler
                B       EXTINT02_SWINT18_Handler

                PUBWEAK EXTINT03_SWINT19_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT03_SWINT19_Handler
                B       EXTINT03_SWINT19_Handler

                PUBWEAK EXTINT04_SWINT20_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT04_SWINT20_Handler
                B       EXTINT04_SWINT20_Handler

                PUBWEAK EXTINT05_SWINT21_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT05_SWINT21_Handler
                B       EXTINT05_SWINT21_Handler

                PUBWEAK EXTINT06_SWINT22_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT06_SWINT22_Handler
                B       EXTINT06_SWINT22_Handler

                PUBWEAK EXTINT07_SWINT23_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT07_SWINT23_Handler
                B       EXTINT07_SWINT23_Handler

                PUBWEAK EXTINT08_SWINT24_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT08_SWINT24_Handler
                B       EXTINT08_SWINT24_Handler

                PUBWEAK EXTINT09_SWINT25_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT09_SWINT25_Handler
                B       EXTINT09_SWINT25_Handler

                PUBWEAK EXTINT10_SWINT26_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT10_SWINT26_Handler
                B       EXTINT10_SWINT26_Handler

                PUBWEAK EXTINT11_SWINT27_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT11_SWINT27_Handler
                B       EXTINT11_SWINT27_Handler

                PUBWEAK EXTINT12_SWINT28_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT12_SWINT28_Handler
                B       EXTINT12_SWINT28_Handler

                PUBWEAK EXTINT13_SWINT29_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT13_SWINT29_Handler
                B       EXTINT13_SWINT29_Handler

                PUBWEAK EXTINT14_SWINT30_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT14_SWINT30_Handler
                B       EXTINT14_SWINT30_Handler

                PUBWEAK EXTINT15_SWINT31_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EXTINT15_SWINT31_Handler
                B       EXTINT15_SWINT31_Handler

                PUBWEAK DMA_Error_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_Error_Handler
                B       DMA_Error_Handler

                PUBWEAK DMA_TC0_BTC0_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC0_BTC0_Handler
                B       DMA_TC0_BTC0_Handler

                PUBWEAK DMA_TC1_BTC1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC1_BTC1_Handler
                B       DMA_TC1_BTC1_Handler

                PUBWEAK DMA_TC2_BTC2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC2_BTC2_Handler
                B       DMA_TC2_BTC2_Handler

                PUBWEAK DMA_TC3_BTC3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC3_BTC3_Handler
                B       DMA_TC3_BTC3_Handler

                PUBWEAK DMA_TC4_BTC4_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC4_BTC4_Handler
                B       DMA_TC4_BTC4_Handler

                PUBWEAK DMA_TC5_BTC5_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC5_BTC5_Handler
                B       DMA_TC5_BTC5_Handler

                PUBWEAK DMA_TC6_BTC6_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC6_BTC6_Handler
                B       DMA_TC6_BTC6_Handler

                PUBWEAK DMA_TC7_BTC7_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
DMA_TC7_BTC7_Handler
                B       DMA_TC7_BTC7_Handler

                PUBWEAK EFM_PEError_ReadCol_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EFM_PEError_ReadCol_Handler
                B       EFM_PEError_ReadCol_Handler

                PUBWEAK EFM_OpEnd_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EFM_OpEnd_Handler
                B       EFM_OpEnd_Handler

                PUBWEAK FPU_Error_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
FPU_Error_Handler
                B       FPU_Error_Handler

                PUBWEAK TMR0_1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR0_1_Handler
                B       TMR0_1_Handler

                PUBWEAK TMR0_2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR0_2_Handler
                B       TMR0_2_Handler

                PUBWEAK RTC_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
RTC_Handler
                B       RTC_Handler

                PUBWEAK CLK_XtalStop_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
CLK_XtalStop_Handler
                B       CLK_XtalStop_Handler

                PUBWEAK PWC_WKTM_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
PWC_WKTM_Handler
                B       PWC_WKTM_Handler

                PUBWEAK SWDT_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SWDT_Handler
                B       SWDT_Handler

                PUBWEAK TMR6_1_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_1_GCmp_Handler
                B       TMR6_1_GCmp_Handler

                PUBWEAK TMR6_1_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_1_Ovf_Udf_Handler
                B       TMR6_1_Ovf_Udf_Handler

                PUBWEAK TMR6_1_Dte_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_1_Dte_Handler
                B       TMR6_1_Dte_Handler

                PUBWEAK TMR6_1_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_1_SCmp_Handler
                B       TMR6_1_SCmp_Handler

                PUBWEAK TMRA_1_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_1_Ovf_Udf_Handler
                B       TMRA_1_Ovf_Udf_Handler

                PUBWEAK TMRA_1_Cmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_1_Cmp_Handler
                B       TMRA_1_Cmp_Handler

                PUBWEAK TMR6_2_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_2_GCmp_Handler
                B       TMR6_2_GCmp_Handler

                PUBWEAK TMR6_2_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_2_Ovf_Udf_Handler
                B       TMR6_2_Ovf_Udf_Handler

                PUBWEAK TMR6_2_Dte_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_2_Dte_Handler
                B       TMR6_2_Dte_Handler

                PUBWEAK TMR6_2_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_2_SCmp_Handler
                B       TMR6_2_SCmp_Handler

                PUBWEAK TMRA_2_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_2_Ovf_Udf_Handler
                B       TMRA_2_Ovf_Udf_Handler

                PUBWEAK TMRA_2_Cmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_2_Cmp_Handler
                B       TMRA_2_Cmp_Handler

                PUBWEAK TMR6_3_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_3_GCmp_Handler
                B       TMR6_3_GCmp_Handler

                PUBWEAK TMR6_3_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_3_Ovf_Udf_Handler
                B       TMR6_3_Ovf_Udf_Handler

                PUBWEAK TMR6_3_Dte_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_3_Dte_Handler
                B       TMR6_3_Dte_Handler

                PUBWEAK TMR6_3_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_3_SCmp_Handler
                B       TMR6_3_SCmp_Handler

                PUBWEAK TMRA_3_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_3_Ovf_Udf_Handler
                B       TMRA_3_Ovf_Udf_Handler

                PUBWEAK TMRA_3_Cmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_3_Cmp_Handler
                B       TMRA_3_Cmp_Handler

                PUBWEAK TMR6_4_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_4_GCmp_Handler
                B       TMR6_4_GCmp_Handler

                PUBWEAK TMR6_4_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_4_Ovf_Udf_Handler
                B       TMR6_4_Ovf_Udf_Handler

                PUBWEAK TMR6_4_Dte_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_4_Dte_Handler
                B       TMR6_4_Dte_Handler

                PUBWEAK TMR6_4_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR6_4_SCmp_Handler
                B       TMR6_4_SCmp_Handler

                PUBWEAK TMRA_4_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_4_Ovf_Udf_Handler
                B       TMRA_4_Ovf_Udf_Handler

                PUBWEAK TMRA_4_Cmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_4_Cmp_Handler
                B       TMRA_4_Cmp_Handler

                PUBWEAK HRPWM_1_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_1_GCmp_Handler
                B       HRPWM_1_GCmp_Handler

                PUBWEAK HRPWM_1_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_1_Ovf_Udf_Handler
                B       HRPWM_1_Ovf_Udf_Handler

                PUBWEAK HRPWM_1_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_1_SCmp_Handler
                B       HRPWM_1_SCmp_Handler

                PUBWEAK HRPWM_1_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_1_GCap_Handler
                B       HRPWM_1_GCap_Handler

                PUBWEAK HRPWM_2_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_2_GCmp_Handler
                B       HRPWM_2_GCmp_Handler

                PUBWEAK HRPWM_2_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_2_Ovf_Udf_Handler
                B       HRPWM_2_Ovf_Udf_Handler

                PUBWEAK HRPWM_2_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_2_SCmp_Handler
                B       HRPWM_2_SCmp_Handler

                PUBWEAK HRPWM_2_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_2_GCap_Handler
                B       HRPWM_2_GCap_Handler

                PUBWEAK HRPWM_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_Handler
                B       HRPWM_Handler

                PUBWEAK EMB_GR0_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR0_Handler
                B       EMB_GR0_Handler

                PUBWEAK EMB_GR1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR1_Handler
                B       EMB_GR1_Handler

                PUBWEAK EMB_GR2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR2_Handler
                B       EMB_GR2_Handler

                PUBWEAK EMB_GR3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR3_Handler
                B       EMB_GR3_Handler

                PUBWEAK HRPWM_3_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_3_GCmp_Handler
                B       HRPWM_3_GCmp_Handler

                PUBWEAK HRPWM_3_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_3_Ovf_Udf_Handler
                B       HRPWM_3_Ovf_Udf_Handler

                PUBWEAK HRPWM_3_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_3_SCmp_Handler
                B       HRPWM_3_SCmp_Handler

                PUBWEAK HRPWM_3_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_3_GCap_Handler
                B       HRPWM_3_GCap_Handler

                PUBWEAK HRPWM_4_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_4_GCmp_Handler
                B       HRPWM_4_GCmp_Handler

                PUBWEAK HRPWM_4_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_4_Ovf_Udf_Handler
                B       HRPWM_4_Ovf_Udf_Handler

                PUBWEAK HRPWM_4_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_4_SCmp_Handler
                B       HRPWM_4_SCmp_Handler

                PUBWEAK HRPWM_4_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_4_GCap_Handler
                B       HRPWM_4_GCap_Handler

                PUBWEAK EMB_GR4_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR4_Handler
                B       EMB_GR4_Handler

                PUBWEAK EMB_GR5_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR5_Handler
                B       EMB_GR5_Handler

                PUBWEAK EMB_GR6_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR6_Handler
                B       EMB_GR6_Handler

                PUBWEAK EMB_GR7_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR7_Handler
                B       EMB_GR7_Handler

                PUBWEAK EMB_GR8_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EMB_GR8_Handler
                B       EMB_GR8_Handler

                PUBWEAK HRPWM_5_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_5_GCmp_Handler
                B       HRPWM_5_GCmp_Handler

                PUBWEAK HRPWM_5_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_5_Ovf_Udf_Handler
                B       HRPWM_5_Ovf_Udf_Handler

                PUBWEAK HRPWM_5_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_5_SCmp_Handler
                B       HRPWM_5_SCmp_Handler

                PUBWEAK HRPWM_5_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_5_GCap_Handler
                B       HRPWM_5_GCap_Handler

                PUBWEAK HRPWM_6_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_6_GCmp_Handler
                B       HRPWM_6_GCmp_Handler

                PUBWEAK HRPWM_6_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_6_Ovf_Udf_Handler
                B       HRPWM_6_Ovf_Udf_Handler

                PUBWEAK HRPWM_6_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_6_SCmp_Handler
                B       HRPWM_6_SCmp_Handler

                PUBWEAK HRPWM_6_GCap_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
HRPWM_6_GCap_Handler
                B       HRPWM_6_GCap_Handler

                PUBWEAK MCANRAM_ECCError_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MCANRAM_ECCError_Handler
                B       MCANRAM_ECCError_Handler

                PUBWEAK MCAN1_INT0_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MCAN1_INT0_Handler
                B       MCAN1_INT0_Handler

                PUBWEAK MCAN1_INT1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MCAN1_INT1_Handler
                B       MCAN1_INT1_Handler

                PUBWEAK MCAN2_INT0_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MCAN2_INT0_Handler
                B       MCAN2_INT0_Handler

                PUBWEAK MCAN2_INT1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
MCAN2_INT1_Handler
                B       MCAN2_INT1_Handler

                PUBWEAK TMR4_GCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR4_GCmp_Handler
                B       TMR4_GCmp_Handler

                PUBWEAK TMR4_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR4_Ovf_Udf_Handler
                B       TMR4_Ovf_Udf_Handler

                PUBWEAK TMR4_Reload_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR4_Reload_Handler
                B       TMR4_Reload_Handler

                PUBWEAK TMR4_SCmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMR4_SCmp_Handler
                B       TMR4_SCmp_Handler

                PUBWEAK CMP1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
CMP1_Handler
                B       CMP1_Handler

                PUBWEAK CMP2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
CMP2_Handler
                B       CMP2_Handler

                PUBWEAK CMP3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
CMP3_Handler
                B       CMP3_Handler

                PUBWEAK I2C_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
I2C_Handler
                B       I2C_Handler

                PUBWEAK USART1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART1_Handler
                B       USART1_Handler

                PUBWEAK USART1_TxComplete_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART1_TxComplete_Handler
                B       USART1_TxComplete_Handler

                PUBWEAK SPI_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
SPI_Handler
                B       SPI_Handler

                PUBWEAK TMRA_5_Ovf_Udf_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_5_Ovf_Udf_Handler
                B       TMRA_5_Ovf_Udf_Handler

                PUBWEAK TMRA_5_Cmp_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
TMRA_5_Cmp_Handler
                B       TMRA_5_Cmp_Handler

                PUBWEAK EVENT_PORT1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EVENT_PORT1_Handler
                B       EVENT_PORT1_Handler

                PUBWEAK EVENT_PORT2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EVENT_PORT2_Handler
                B       EVENT_PORT2_Handler

                PUBWEAK EVENT_PORT3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EVENT_PORT3_Handler
                B       EVENT_PORT3_Handler

                PUBWEAK EVENT_PORT4_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
EVENT_PORT4_Handler
                B       EVENT_PORT4_Handler

                PUBWEAK USART2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART2_Handler
                B       USART2_Handler

                PUBWEAK USART2_TxComplete_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART2_TxComplete_Handler
                B       USART2_TxComplete_Handler

                PUBWEAK USART3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART3_Handler
                B       USART3_Handler

                PUBWEAK USART3_TxComplete_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART3_TxComplete_Handler
                B       USART3_TxComplete_Handler

                PUBWEAK USART4_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART4_Handler
                B       USART4_Handler

                PUBWEAK USART4_TxComplete_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART4_TxComplete_Handler
                B       USART4_TxComplete_Handler

                PUBWEAK USART1_WKUP_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
USART1_WKUP_Handler
                B       USART1_WKUP_Handler

                PUBWEAK PWC_LVD1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
PWC_LVD1_Handler
                B       PWC_LVD1_Handler

                PUBWEAK PWC_LVD2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
PWC_LVD2_Handler
                B       PWC_LVD2_Handler

                PUBWEAK FCM_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
FCM_Handler
                B       FCM_Handler

                PUBWEAK WDT_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
WDT_Handler
                B       WDT_Handler

                PUBWEAK CTC_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
CTC_Handler
                B       CTC_Handler

                PUBWEAK ADC1_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
ADC1_Handler
                B       ADC1_Handler

                PUBWEAK ADC2_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
ADC2_Handler
                B       ADC2_Handler

                PUBWEAK ADC3_Handler
                SECTION .text:CODE:NOROOT:REORDER(1)
ADC3_Handler
                B       ADC3_Handler

                END
