require 'byebug'
class Robot

  DIRECTIONS = { north: 'North', east: 'East', south: 'South', west: 'West' }
  DIRECTION_INDEX = { north: 0, east: 1, south: 2, west: 3 }

  attr_accessor :position, :facing_direction

  def initialize
    @position ||= [0, 0]
    @facing_direction ||= DIRECTIONS[:north]
  end

  def move(instructions)
    @instructions = instructions.gsub(' ', '').upcase
    check_instruction(@instructions)
    @instructions.split('').each do |instruction|
      is_advance?(instruction) ? advance : turn(instruction)
    end
  end

  def advance
    x = position.first
    y = position.last
    case facing_direction
      when DIRECTIONS[:north]
        y += 1
      when DIRECTIONS[:east]
        x +=1
      when DIRECTIONS[:south]
        y -= 1
      when DIRECTIONS[:west]
        x -= 1
      end
    self.position = [x, y]
  end

  def turn(instruction)
    facing_direction_index = instruction == 'R' ? turn_right : turn_left
    facing_direction(facing_direction_index)
  end

  private

  def check_instruction(instructions)
    #checks regex and raise error
  end

  def is_advance?(instruction)
    instruction == 'A'
  end

  def turn_right
    facing_direction_symbol = facing_direction.downcase.to_sym
    (DIRECTION_INDEX[facing_direction_symbol] + 1) % DIRECTIONS.size
  end

  def turn_left
    facing_direction_symbol = facing_direction.downcase.to_sym
    (DIRECTION_INDEX[facing_direction_symbol] - 1) % DIRECTIONS.size
  end

  def facing_direction(facing_direction_index)
    facing_direction_key = DIRECTION_INDEX.key(facing_direction_index)
    self.facing_direction = DIRECTIONS[facing_direction_key]
  end
end
