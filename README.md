# Simple-General-Purpose-Processor

The processor is comprised of registers, a 4x16 decoder, a finite state machine (FSM), an arithmetic logic unit (ALU), and 7-segment displays. Each component will be explained in detail below.

Registers
These constitute the most basic elements of the processor, serving as storage units for the two 8-bit inputs. In technical terms, they function as D Flip-flops with an asynchronous active-high reset. In other words, they capture the current input at the rising edge of the clock and reset to 0 when the reset pin is raised.

4x16 Decoder
A decoder transforms an encoded input into a corresponding encoded output, featuring a specific number of inputs and outputs. In the context of the processor, the 4x16 decoder is employed, accepting a 4-bit wide signal as input and generating a 16-bit wide signal as output, with only one output bit active at any given moment. For the decoder to operate, the enable pin must be raised; otherwise, the output defaults to 0. This decoder plays a crucial role in configuring the proper operation code for the ALU, constituting, along with the FSM, the processor's control unit.

Finite State Machine (FSM)
The specific FSM integrated into this processor is a Mealy FSM, signifying that its output relies on both its input and current state. Comprising nine states, each aligning with a digit of my student number, the FSM cycles through these states, furnishing the 4-bit input necessary for the 4x16 decoder. This process culminates in the formation of the processor's control unit.

Arithmetic Logic Unit (ALU)
The ALU is capable of executing arithmetic and bitwise operations on two 8-bit inputs (A and B). The specific operation is determined by the operation code obtained from the 4x16 decoder, which, in turn, is dictated by the current state of the FSM.

The ALU produces four outputs: result_1, result_2, neg, and carry. To accommodate 7-segment displays, which require 4-bit inputs, the operation results are divided into two 4-bit outputs, result_1 and result_2. The neg output is linked to a distinct 7-segment display and is activated if the operation yields a negative result. Likewise, the carry output is activated if the operation introduces a carry bit.

7-Segment Displays

7-Segment displays are employed to showcase the outcomes of operations conducted on the two inputs, capable of presenting values ranging from 0 to 15 in hexadecimal (0-9, A-F). Each segment on the display is designated with a letter from 'a' to 'g'. By configuring specific combinations of segments to high, it becomes possible to display numbers and characters. For instance, configuring the display input as 11111110 will activate segments a-f while keeping segment g inactive, resulting in the display of the numeral 0 on the 7-segment display. Notably, 7-segment displays come in two variants: common-cathode and common-anode. In a common-cathode display, the cathodes (negative ends) of each LED are interconnected, necessitating them to be set high to activate each segment. Conversely, in a common-anode display, the anodes (positive ends) of each LED are linked, requiring them to be pulled low to activate each segment. It is assumed that common-cathode displays are utilized with this processor. In the case of a common-anode display, the input would need to be inverted.

By integrating all these components and ensuring that all sequential elements are synchronized to the same clock signal, the basic processor comes to fruition.
