# frozen_string_literal: true

require 'dry/cli'
require 'lotto/domain/lottery_analyzer'
require 'lotto/data/file_handler'

module Lotto
  module CLI
    module Commands
      class LuckyNumbers < Dry::CLI::Command
        desc "Show lucky numbers (most frequently drawn)"

        option :tens, default: "6", values: %w[6 7 8 9], desc: "Number of tens per group"

        def call(**options)
          tens_per_game = options.fetch(:tens).to_i

          lines = Data::FileHandler.read_lines("lotto.txt")
          results = Domain::LotteryAnalyzer.analyze(lines, tens_per_game)

          results.each do |group|
            puts group.map { |n| n.to_s.rjust(2, "0") }.join(" ")
          end
        rescue Errno::ENOENT
          warn "Error: lotto.txt not found. Run 'load' command first."
          exit 1
        end
      end
    end
  end
end
