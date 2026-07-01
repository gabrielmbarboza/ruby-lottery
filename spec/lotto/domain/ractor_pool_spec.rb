# frozen_string_literal: true

require 'spec_helper'
require 'lotto/domain/ractor_pool'

RSpec.describe Lotto::Domain::RactorPool do
  describe '#map' do
    it 'processes items with fibers' do
      results = []
      pool = described_class.new(size: 2) do |item|
        results << item * 2
      end

      items = [1, 2, 3, 4]
      pool.map(items)

      expect(results.sort).to eq([2, 4, 6, 8])
    end

    it 'handles empty items array' do
      pool = described_class.new(size: 2) do |item|
        item
      end

      results = pool.map([])
      expect(results).to eq([])
    end
  end
end
