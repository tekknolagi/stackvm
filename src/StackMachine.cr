require "./StackMachine/*"

module StackMachine
  include OP
  include Reg

  vm = VM.new

  program = Program{
    PUSH, 25,
    LOAD, 1,
    PTOP,
    HALT, 0,
    250
  }

  vm.init(memory_size: 64) # 64 Int32 values
  vm.run program
  exit_code = vm.regs[EXT]
  puts "Exited with #{exit_code}"
  vm.clean
  exit exit_code

end
