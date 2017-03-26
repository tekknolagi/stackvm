require "./spec_helper.cr"

describe StackVM::Machine do

  it "creates a new machine" do
    machine = StackVM::Machine::Machine.new 16

    machine.regs.size.should eq 19
    machine.regs.bytesize.should eq 152

    machine.memory.size.should eq 16
    machine.memory.bytesize.should eq 16
  end

  it "reset's memory" do
    machine = StackVM::Machine::Machine.new 16

    machine.memory[0] = 25_u8
    machine.memory[0].should eq 25_u8

    machine.reset_memory

    machine.memory[0].should eq 0_u8
  end

  it "flashes data into the machine" do
    machine = StackVM::Machine::Machine.new 16

    machine.flash Slice[25_u8, 25_u8, 25_u8, 25_u8]

    machine.memory[0].should eq 25
    machine.memory[1].should eq 25
    machine.memory[2].should eq 25
    machine.memory[3].should eq 25
  end

  it "grows the machines memory section" do
    machine = StackVM::Machine::Machine.new 16

    machine.memory[0] = 25_u8

    machine.memory.size.should eq 16
    machine.memory[0].should eq 25

    machine.grow 64

    machine.memory.size.should eq 64
    machine.memory[0].should eq 25
  end

  it "fetches an instruction" do
    machine = StackVM::Machine::Machine.new 16
    machine.flash Slice(UInt8).new(2).tap { |memory|
      memory[0] = 0b10100000_u8
      memory[1] = 0b00011100_u8
    }

    instruction = machine.fetch

    instruction.should be_a StackVM::Machine::Instruction
    instruction.flag_s.should eq true
    instruction.flag_t.should eq false
    instruction.flag_b.should eq true
    instruction.opcode.should eq 0b00011100_u8
  end

end
