# frozen_string_literal: true

require 'spec_helper'
require 'lotto/domain/ractor_pool'

RSpec.describe Lotto::Domain::RactorPool do
  describe '#map' do
    it 'processes items in parallel' do
      results = []
      pool = described_class.new(size: 2) do
        Ractor.yield(Ractor.receive)
      end

      items = [1, 2, 3, 4]
      pool.map(items)

      expect(results).to eq([1, 2, 3, 4])
    end

    it 'handles empty items array' do
      pool = described_class.new(size: 2) do
        Ractor.yield(Ractor.receive)
      end

      results = pool.map([])
      expect(results).to eq([])
    end
  end
end
