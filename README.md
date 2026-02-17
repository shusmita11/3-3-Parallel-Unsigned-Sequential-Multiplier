# 3-3-Parallel-Unsigned-Sequential-Multiplier

This project presents the design and implementation of an unsigned 3×3 3 unsigned, parallel, 
sequential multiplier using SystemVerilog, based on a finite state machine (FSM) and datapath 
architecture. The multiplier performs sequential multiplication through repeated addition over 
multiple clock cycles instead of a single-cycle combinational approach. Two architectures are 
implemented: an ALU-only design and an ALU-with-counter design. Functional simulation 
using SystemVerilog testbenches confirms correct operation for all tested cases. The study 
finds that the ALU-only architecture is suitable for hardware-constrained systems, while the 
counter-based architecture reduces FSM state complexity and improves efficiency. The 
proposed designs demonstrate scalable and reliable approaches for sequential arithmetic units 
in digital systems.
