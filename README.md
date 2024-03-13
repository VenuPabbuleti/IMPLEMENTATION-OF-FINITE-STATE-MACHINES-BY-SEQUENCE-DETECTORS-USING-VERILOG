# IMPLEMENTATION-OF-FINITE-STATE-MACHINES-BY-SEQUENCE-DETECTORS-USING-VERILOG

Finite State Machines (FSMs) in digital systems are mathematical models of computation where a system can be in one of a finite number of states at any given time. There are two main types of FSMs: Mealy State Machines and Moore State Machines.
### Mealy State Machine: 
  Outputs depend on both present inputs and present states. It consists of combinational logic and memory to produce outputs based on inputs and states. The number of states required in a Mealy state machine is generally less than or equal to that in a Moore state machine.
### Moore State Machine:
  Outputs depend only on present states. Similar to the Mealy machine, it includes combinational logic and memory, but the outputs are based solely on the present states. The number of states required in a Moore state machine is usually more than or equal to that in a Mealy state machine.


# Sequence Detectors
  Sequence Detectors are one of the applications of Finite State Machines (FSM's).
  There are two main types of sequence detectors based on the type of sequence they identify:
  
 ### Overlapping Sequence Detector: 
   This type allows overlap, where the final bits of one sequence can be the start of another sequence.
### Non-Overlapping Sequence Detector:
  In this case, the detector resets itself to the start state when a sequence is detected, without allowing overlap.

#
In this task, I tackled the challenge of detecting specific sequences within a stream of data, leveraging Verilog's powerful syntax and simulation tools to design and validate the functionality.

Key highlights include:

🔹 Understanding the different types of finite State machines 

🔹 Implementation of FSM by different processes (procedural blocks)

🔹 Writing Verilog code to define state transitions and outputs for sequence detection.

🔹 Simulation and verification of the design using Xilinx Vivado tool



# This repository includes

1>Different types of implementation of FSMS using Verilog

  -->01> Using Single Process method(1 procedural block)
  
  -->02> Using Two process method (2 procedural block)
  
  -->03> Using Two process method (2 procedural block-->separate blocks for states and output)
  
  -->04> Using Three process method (3 procedural blocks -->separate blocks for state assignment,next state and output)
  
05> 1010 Non-Overlapping sequence detector using Mealy Machine

06> 1010 Overlapping sequence detector using Mealy Machine

07> 1010 Non-Overlapping sequence detector using Moore Machine

08> 1010 Overlapping sequence detector using Moore Machine

09> 101X Overlapping sequence detector using Mealy Machine

10> 10X0 Overlapping sequence detector using Moore Machine
