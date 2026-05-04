// =============================================================================
// CS 271 Computer Architecture - Lab 01: String Copy (STRCPY)
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Gueswende Kafando
// DATE:        2026
// =============================================================================
// OBJECTIVE:
//   Implement a loop that copies a null-terminated string from a source
//   address to a destination address, simulating the classic C strcpy()
//   function.
//
// MEMORY LAYOUT:
//   - Source string starts at address 0x50 (80 decimal)
//   - Destination buffer starts at address 0x13C (316 decimal)
//   - The source string is: "Hello" (5 characters + null terminator)
//
// EXPECTED OUTCOME:
//   - The string "Hello" should be copied to the destination
//   - Your loop should iterate 6 times (5 letters + 1 null terminator)
//   - Simulation output: "[EDUCORE LOG]: Apollo has landed"
//
// INSTRUCTIONS:
//   1. Complete the TODO sections below (5 lines of code total)
//   2. Run: make sim_lab01
//   3. Verify success with "Apollo has landed" message
//   4. (Optional) Open Surfer to view waveforms
// =============================================================================

    .text
    .global _start

_start:
    // =========================================================================
    // STEP 1: Initialize Pointers (Already done for you)
    // =========================================================================
    // These lines set up X0 to point to the source string
    // and X1 to point to the destination buffer.
    // DO NOT MODIFY these two lines.
    
    MOV     X0, #0x50       // X0 = source pointer (address 0x50)
    MOV     X1, #0x13C      // X1 = destination pointer (address 0x13C)

    // =========================================================================
    // STEP 2: Implement the Copy Loop (YOUR CODE GOES HERE)
    // =========================================================================
    // You need to write 5 instructions inside this loop:
    //   1. Load a byte from source
    //   2. Store that byte to destination
    //   3. Check if it was the null terminator
    //   4. Increment both pointers
    //   5. Loop back
    
copy_loop:
    // -------------------------------------------------------------------------
    // TODO #1: Load a byte from the source address [X0] into W2
    // Syntax: LDRB Wt, [Xn]   (Load Register Byte)
    // -------------------------------------------------------------------------
    
    // YOUR CODE HERE
    LDRB    W2, [X0]
    // -------------------------------------------------------------------------
    // TODO #2: Store the byte from W2 to the destination address [X1]
    // Syntax: STRB Wt, [Xn]   (Store Register Byte)
    // -------------------------------------------------------------------------
    
    // YOUR CODE HERE
     STRB    W2, [X1]
    // -------------------------------------------------------------------------
    // TODO #3: Check if the byte was the null terminator (0)
    // If W2 == 0, branch to 'done'
    // Syntax: CBZ Wt, label   (Compare and Branch if Zero)
    // -------------------------------------------------------------------------
    
    // YOUR CODE HERE
    CBZ     W2, done
    // -------------------------------------------------------------------------
    // TODO #4: Increment both pointers to the next byte
    // You need TWO ADD instructions (one for X0, one for X1)
    // Syntax: ADD Xd, Xn, #1
    // -------------------------------------------------------------------------
    
    // YOUR CODE HERE (two lines)
    ADD     X0, X0, #1
    ADD     X1, X1, #1
    // -------------------------------------------------------------------------
    // TODO #5: Loop back to copy the next character
    // Syntax: B label   (Branch - unconditional jump)
    // -------------------------------------------------------------------------
    
    // YOUR CODE HERE
    B       copy_loop
    // =========================================================================
    // STEP 3: Signal Completion (Already done for you)
    // =========================================================================
done:
    // When your loop exits (after copying the null terminator),
    // execution reaches here and YIELD signals success.
    YIELD

// =============================================================================
// DATA SECTION (DO NOT MODIFY)
// =============================================================================
// This section defines the source string and destination buffer in memory.
// The assembler will place "Hello\0" at address 0x50.

    .data
    .org 0x50
source_string:
    .asciz "Hello"          // "Hello" + null terminator (6 bytes total)

    .org 0x13C
dest_buffer:
    .space 16               // 16 bytes reserved for the copied string
