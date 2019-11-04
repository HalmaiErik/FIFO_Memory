# FIFO-Memory
FIFO Memory for an FPGA

## Description
The FIFO Memory uses First In First Out or queue logic. This means that the first element read will be the first one displayed. This is done with two operations: push and pop. The push operation does the reading of the information into a RAM memory, while with pop we can display the information on the FPGA display.

## Configuration
The project was created for Nexys 3 FPGAs. It won't work on any other FPGA type.
The project was first created and simulated in Active-HDL and then transfered to ISE Desgin Suit - Xilinx where it could be used on an FPGA.

## Installation
In ISE click File/Open Project/.../FIFO.xise and click Open.

## Usage
1. At first the Memory will be empty. This is shown by the T11 led.
2. To add an element, the Data-In switches are T10 -> T5 (least significant bit to most significant bit), so you can enter any number with 8 bits.
3. Once you entered the element that you want to add, press the Push button, D9.
4. The memory has a capacity of 16 elements. Once 15 elements are in the memory, the R11 led will light up showing that you can only enter one more element. Once there are 16 elements, the memory will be full and the led N11 will light up.
5. To Pop an element from the memory press the C4 button and the first element entered will be displayed onto the FPGA display.





