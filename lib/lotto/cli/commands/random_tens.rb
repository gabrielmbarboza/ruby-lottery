# frozen_string_literal: true

require 'dry/cli'
require 'lotto/domain/random_generator'

module Lotto
  module CLI
    module Commands
      class RandomTens < Dry::CLI::Command
        desc "Generate random lottery combinations"

        option :games, default: "1", desc: "Number of games to generate"
        option :tens, default: "6", values: %w[6 7 8 9], desc: "Number of tens per game"

        def call(**options)
          games = options.fetch(:games).to_i
          tens_per_game = options.fetch(:tens).to_i

          results = Domain::RandomGenerator.generate_games(games, tens_per_game)

          results.each do |game|
            puts game.map { |n| n.to_s.rjust(2, "0") }.join(" ")
          end
        end
      end
    end
  end
end
