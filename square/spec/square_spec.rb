require 'rspec'
require_relative '../src/square'

describe Square, type: :model do

  # let(:side) { puts 'side: 6'; 6 }
  let!(:square) { puts 'new square'; Square.new(6) }

  context '#perimeter' do
    it 'calculates the perimeter as 24' do
      puts 'Something'
      square
      expect(square.perimeter).to eq(24)
      puts 'perimeter'
    end
  end

  context '#area' do
    it 'calculates the area as 36' do
      # expect(square.area).to eq(36)
      puts 'area'
    end
  end
end
