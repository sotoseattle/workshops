require 'spec_helper'

describe 'Location' do
  let(:loc) { Location.new(0, 0) }

  describe 'a new location' do
    it 'is created with coordinates' do
      loc.x.must_equal 0
      loc.y.must_equal 0
    end
  end

  describe '#adjacents' do
    it { Location.new(rand, rand).adjacents.size.must_equal 8 }
  end

  describe '#==' do
    it { loc.must_equal Location.new(0, 0) }
    it { loc.wont_equal Location.new(0, 1) }
  end
end
