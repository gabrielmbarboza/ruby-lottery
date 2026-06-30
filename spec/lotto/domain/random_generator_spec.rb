# frozen_string_literal: true

require 'spec_helper'
require 'lotto/domain/random_generator'

RSpec.describe Lotto::Domain::RandomGenerator do
  describe '.generate_games' do
    it 'generates correct number of games' do
      result = described_class.generate_games(5, 6)

      expect(result).to have(5).items
    end

    it 'generates games with correct number of tens' do
      result = described_class.generate_games(3, 6)

      expect(result.all? { |game| game.size == 6 }).to be true
    end

    it 'all numbers are in valid range' do
      result = described_class.generate_games(10, 6)

      result.each do |game|
        expect(game.all? { |num| num.between?(1, 60) }).to be true
      end
    end

    it 'numbers in each game are sorted' do
      result = described_class.generate_games(5, 6)

      expect(result.all? { |game| game == game.sort }).to be true
    end
  end
end
