# Lab 04: Pipeline Hazard Analysis

**Student Name:** Gueswende Kafando

## Instructions

1. Update the README.md file and the test_lab04.s documents in the Lab04 folder with the documents listed in Week 15 of Brightspace.
2. Run `make sim_lab04` from the repo root.
3. Open `dump.vcd` in Surfer and observe the pipeline stages.
4. Use the waveforms to answer each question below.

## Surfer Setup Walkthrough

The names below are the actual signal names you should search for in Surfer.

| Register Signal | Meaning |
|-----------------|---------|
| `test_Educore.educore.register_file.rX00` | X0 |
| `test_Educore.educore.register_file.rX01` | X1 |
| `test_Educore.educore.register_file.rX02` | X2 |
| `test_Educore.educore.register_file.rX03` | X3 |
| `test_Educore.educore.register_file.rX04` | X4 |
| `test_Educore.educore.register_file.rX05` | X5 |
| `test_Educore.educore.register_file.rX06` | X6 |
| `test_Educore.educore.register_file.rX07` | X7 |
| `test_Educore.educore.register_file.rX09` | X9 |
| `test_Educore.educore.register_file.rX10` | X10 |
| `test_Educore.educore.register_file.rX11` | X11 |
| `test_Educore.educore.register_file.rX12` | X12 |

## Part A: Register Values

### Step 1:
In the terminal run: `make sim_lab04`

### Step 2:
Open the `dump.vcd` file in Surfer. Then fill out the table below:

| Register | Expected Value | Your Observed Value | Match? (Y/N) |
|----------|----------------|---------------------|--------------|
| X0 | 0xF (15) | 0xF (15) | Y |
| X1 | 0xE (14) | 0xE (14) | Y |
| X2 | 0xD (13) | 0xD (13) | Y |
| X3 | 0xC (12) | 0xC (12) | Y |
| X4 | 0xB (11) | 0xB (11) | Y |
| X5 | 0x10 (16) | 0x10 (16) | Y |
| X6 | 0x1B (27) | 0x1B (27) | Y |
| X7 | 0x1 (1) | 0x1 (1) | Y |
| X9 | 0x1B (27) | 0x1B (27) | Y |
| X10 | likely UNDEF due to RAW hazard | UNDEF | Y |
| X11 | likely UNDEF due to RAW hazard | UNDEF | Y |
| X12 | likely UNDEF due to RAW hazard | UNDEF | Y |

## Part B: Adding Two NOP Commands

### Step 1:
In `test_lab04.s`, replace the code only within Part 3 with:

```asm
_test2:
    ADD     X9, X1, X2          // X9 = X1 + X2 = 27
    NOP                         // first NOP command
    NOP                         // second NOP command
    AND     X10, X9, X3         // X10 = X9 AND X3
    ORR     X11, X5, X9         // X11 = X5 OR X9
    SUB     X12, X9, X7         // X12 = X9 - X7
```

### Step 2:
In the terminal, rerun: `make sim_lab04`

### Step 3:
Open the `dump.vcd` file in Surfer. Then fill out the table below:

| Register | Expected Value | Your Observed Value | Match? (Y/N) |
|----------|----------------|---------------------|--------------|
| X9 | 0x1B (27) | 0x1B (27) | Y |
| X10 | likely UNDEF due to RAW hazard | UNDEF | Y |
| X11 | x5 = 16 or x9 = 27 Which one? | X5=16 | Y |
| X12 | 0x1A (26) | 0x1A (26) | Y |

### Analysis Question: Why is X10 still UNDEF while X11 and X12 completed?

**Pipeline Timing:** The ADD instruction hasn't finished its Writeback (WB) stage when AND tries to read X9 in Decode (ID).

**Stale Data:** Two NOPs aren't enough to let the value 27 reach the register file before it's needed.

**Delayed Success:** X11 and X12 start later, allowing enough cycles for the ADD to finally commit its data.

### Additional Signals for Analysis

If you find it helpful for answering this question you may want to add these signals to Surfer:

| Signal | What It Shows |
|--------|---------------|
| `test_Educore.educore.clk` | Clock cycles |
| `test_Educore.educore.PC` | Program Counter in Fetch |
| `test_Educore.educore.ID_PC` | Program Counter for Decode-stage instruction |
| `test_Educore.educore.instruction_memory_v` | Instruction currently being fetched from instruction memory |
| `test_Educore.educore.instruction` | Instruction currently being decoded |
| `test_Educore.educore.EX_exec_n` | One Execute-stage operand |
| `test_Educore.educore.EX_exec_m` | Second Execute-stage operand or immediate |
| `test_Educore.educore.alu_out` | ALU result in Execute |
| `test_Educore.educore.WB_write_en` | Whether Writeback is writing a register this cycle |
| `test_Educore.educore.WB_rd_addr` | Which register number is written in Writeback |
| `test_Educore.educore.WB_ex_out` | Value being written back |

## Part C: Adding an Additional NOP Command

### Step 1:
In `test_lab04.s`, replace the code only within Part 3 with:

```asm
_test2:
    ADD     X9, X1, X2          // X9 = X1 + X2 = 27
    NOP                         // first NOP command
    NOP                         // second NOP command
    NOP                         // third NOP command
    AND     X10, X9, X3         // X10 = X9 AND X3
    ORR     X11, X5, X9         // X11 = X5 OR X9
    SUB     X12, X9, X7         // X12 = X9 - X7
```

### Step 2:
In the terminal, rerun: `make sim_lab04`

### Step 3:
Open the new `dump.vcd` file in Surfer and observe the results.

### Step 4:
Open the `dump.vcd` file in Surfer. Then fill out the table below:

| Register | Expected Value | Your Observed Value | Match? (Y/N) |
|----------|----------------|---------------------|--------------|
| X10 | 0x1B (27) | 0x1B (27) | Y |

### Analysis Question: Explain why adding the third NOP allowed the register X10 to be updated with a value?

Adding the third NOP provides exactly enough delay (clock cycles) to resolve the timing conflict. The third NOP ensures that the ADD instruction reaches the Writeback (WB) stage before the AND instruction attempts to read X9 in the Decode (ID) stage. This "software stall" allows the register file to be updated with the value 27 so that the subsequent AND instruction can read the correct, stable data rather than an undefined value.

