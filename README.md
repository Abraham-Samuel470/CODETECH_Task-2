Name: Kanumuri Abraham Samuel Nagaraju

Company: CODETECH IT SOLUTIONS

ID:CT08DS8892

Domain: VLSI

Duration: 5th October 2024 to 5th November 2024

Mentor: Neela Santhosh


### FINTE STATE MACHINE
# Mealy and Moore State Machines in Verilog

This repository contains the Verilog implementations of **Mealy** and **Moore** finite state machines (FSM). These designs illustrate the differences between the two types of state machines based on how they generate their output signals.

## Project Overview

### 1. **Moore Machine**
- In the Moore machine, the output depends only on the current state.
- The `detect` signal is updated solely based on the state transitions, and changes occur synchronously with the clock.
- The machine transitions through several states based on the input (`inbits`), and outputs are generated only when certain states are reached.

### 2. **Mealy Machine**
- The Mealy machine's output depends on both the current state and the input signal (`inbits`).
- This results in faster output changes, as the `detect` signal can respond to input changes immediately, without waiting for a state change.
- The design handles state transitions similarly to the Moore machine but with added input dependence for the output.

## Features
**Clocked FSM Design**: Both machines are synchronous, with state transitions occurring on the rising edge of the clock signal.
**Reset Functionality**: Both machines have a reset signal that initializes the state machine to its starting state.
**Testbenches Included**: Simulate the behavior of both machines with detailed testbenches, ensuring correct functionality for different input patterns.

## How to Run
1. Clone the repository.
2. Use a Verilog simulation tool like **Vivado** to synthesize and simulate the provided designs.
3. View the waveforms for the state transitions and outputs in the simulation window.
