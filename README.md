# Virtual Machine

This is my try at writing a virtual machine. The only datatype it supports right now is a 32-bit signed integer.
It supports registers and a stack.

The instruction-set and registers are inspired by the [Carp VM](https://github.com/tekknolagi/carp) by [@tekknolagi](https://github.com/tekknolagi).

It is written in [Crystal](https://crystal-lang.org).

## Opcodes

| Name   | Arguments | Description                                                                                                          |
|--------|-----------|----------------------------------------------------------------------------------------------------------------------|
| ADD    |           | Pops off two values and pushes their sum                                                                             |
| SUB    |           | Pops off two values and pushes their difference (lower - upper)                                                      |
| MUL    |           | Pops off two values and pushes their product                                                                         |
| DIV    |           | Pops off two values and pushes their quotient (lower / upper)                                                        |
| POW    |           | Pops off two values and pushes their power (lower ^ upper)                                                           |
| REM    |           | Pops off two values and pushes their remainder (lower % upper)                                                       |
| SHR    |           | Pops off two values and right shifts the lower value by the upper value (lower >> upper)                             |
| SHL    |           | Pops off two values and left shifts the lower value by the upper value (lower << upper)                              |
| NOT    |           | Performs bitwise NOT on the top value on the stack                                                                   |
| XOR    |           | Pops off two values and pushes the bitwise XOR (lower ^ upper)                                                       |
| OR     |           | Pops off two values and pushes the bitwise OR (lower | upper)                                                        |
| AND    |           | Pops off two values and pushes the bitwise AND (lower & upper)                                                       |
| INCR   | reg       | Increments the value in a given register                                                                             |
| DECR   | reg       | Decrements the value in a given register                                                                             |
| INC    |           | Increments the value on top of the stack                                                                             |
| DEC    |           | Decrements the value on top of the stack                                                                             |
| LOADR  | reg, val  | Loads a value into a given register                                                                                  |
| LOAD   | diff      | Pushes the value at `fp + diff` in memory onto the stack                                                             |
| STORE  | val, diff | Stores a value at `fp + diff` in memory                                                                              |
| STORER | reg, diff | Stores the value of a register at `fp + diff` in memory                                                              |
| MOV    | src, dst  | Copies the value of the source register into the destination register                                                |
| PUSHR  | reg       | Pushes the value of a given register onto the stack                                                                  |
| PUSH   | val       | Pushes a given value onto the stack                                                                                  |
| POP    | reg       | Pops a value from the stack into a given register                                                                    |
| CMP    |           | Pops off two values and pushes 0 if they are equal, 1 if not                                                         |  
| LT     |           | Pops off two values and pushes 0 if lower is less than upper, 1 if not                                               |  
| GT     |           | Pops off two values and pushes 0 if lower is greater than upper, 1 if not                                            |  
| JZ     | addr      | Jumps to an absolute address if the top of the stack is 0                                                            |  
| JNZ    | addr      | Jumps to an absolute address if the top of the stack is not 0                                                        |  
| JMP    | addr      | Unconditionally jumps to an absolute address                                                                         |  
| CALL   | addr      | Pushes a stack frame and jumps to an absolute address                                                                |
| RET    |           | Consumes the last stack frame, resets the frame pointer, jumps back to the return address and pops off all arguments |
| PREG   | reg       | Prints the value of a given register                                                                                 |
| PTOP   |           | Prints the top of the stack                                                                                          |
| HALT   |           | Halts the machine                                                                                                    |
| NOP    |           | Does nothing                                                                                                         |

## Registers

| Name     | Purpose         |
|----------|-----------------|
| R0 .. R9 | General purpose |
| AX       | Functions may return via this register |
| IP       | Instruction pointer |
| SP       | Stack pointer |
| FP       | Frame pointer |
| RUN      | Set to 0 while the machine is running |
| EXT      | Exit code |

## Contributing

1. Fork it ( https://github.com/KCreate/StackMachine/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [KCreate](https://github.com/KCreate) Leonard Schuetz - creator, maintainer
