# frozen_string_literal: true

# spec/spec_methods.rb

require './methods.rb'

RSpec.describe Enumerable do
  let(:test_array_1) { [1, 2, 3, 4, 5] }

  describe '#my_each' do
    it 'returns all elements in the array' do
      expect(test_array_1.my_each { |e| e }).to eql(test_array_1)
    end
  end

end
