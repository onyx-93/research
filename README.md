# Arty A7 FPGA Implementation

This repository contains a complete FPGA implementation of a **Tail Lights Turn Signal Controller** based on the classic 1965 Ford Thunderbird sequential turn signals. The project was developed for the Arty A7-100T board.

## Project Goal

The main objective of this lab was to:

- Design and implement a **sequential logic circuit** using a **Finite State Machine (FSM)** in SystemVerilog.
- Use a **clock divider** to generate a visible slow clock enable signal.
- Synthesize the design for the **Digilent Arty A7-100T** FPGA board.
- Fully automate the build process to generate a bitstream **using only a TCL script** in Vivado.

---

## Features

- **Sequential Turn Signal FSM** with 7 states
- **Slow clock generation** (~0.335 seconds per state transition) from 100 MHz board clock
- Supports **Left turn**, **Right turn**, and **Hazard** (both) patterns
- Automatic sequence repetition
- Clean reset functionality
- ILA debug core ready for waveform analysis
- Fully scripted build flow (no GUI required)
