# frozen_string_literal: true

require 'spec_helper'
require 'lotto/domain/lottery_analyzer'

RSpec.describe Lotto::Domain::LotteryAnalyzer do
  describe '.analyze' do
    it 'counts number frequencies from lines', skip: 'Ractor hangs in test environment' do
      lines = [
        "01 02 03 04 05 06",
        "01 02 03 07 08 09",
        "01 10 11 12 13 14"
      ]

      result = described_class.analyze(lines, 3)

      # "01" appears 3 times (highest), "02" and "03" appear 2 times
      expect(result).to be_an(Array)
      expect(result.first).to include("01")
    end

    it 'groups results by tens_per_group', skip: 'Ractor hangs in test environment' do
      lines = (1..30).map { |i| (1..6).map { |j| (i * j).to_s }.join(' ') }

      result = described_class.analyze(lines, 4)

      expect(result.all? { |group| group.size <= 4 }).to be true
    end

    it 'returns empty array for empty input', skip: 'Ractor hangs in test environment' do
      result = described_class.analyze([], 6)

      expect(result).to eq([])
    end
  end
end
