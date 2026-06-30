# frozen_string_literal: true

module Lotto
  module Domain
    class RandomGenerator
      RANGE_MIN = 1
      RANGE_MAX = 60
      DUPLICATE_TOLERANCE = 3

      def self.generate_games(count = 1, tens_per_game = 6)
        count.times.map do
          generate_single_game(tens_per_game)
        end
      end

      private

      def self.generate_single_game(tens_per_game)
        tens_list = []

        tens_per_game.times do
          random_ten = rand(RANGE_MIN..RANGE_MAX)

          DUPLICATE_TOLERANCE.times do
            break unless tens_list.include?(random_ten)
            random_ten = rand(RANGE_MIN..RANGE_MAX)
          end

          tens_list << random_ten
        end

        tens_list.sort
      end
    end
  end
end
