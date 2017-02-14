require 'rspec'
require 'byebug'
require_relative '../src/robot'

describe Robot do
  let(:position) { [7, 3] }
  let(:facing_direction) { 'North' }
  let(:instruction) { 'RAALAL' }
  let(:robot) { Robot.new }

  before(:each) do
    robot.position = position
    robot.facing_direction = facing_direction
    robot.move(instruction)
  end

  it 'returns end co-ordinate as (9,4)' do
    expect(robot.position).to eq([9, 4])
  end

  it 'returns end facing direction as west' do
    expect(robot.facing_direction).to eq('West')
  end
end
