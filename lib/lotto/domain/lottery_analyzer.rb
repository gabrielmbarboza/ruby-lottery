# frozen_string_literal: true

require 'lotto/domain/ractor_pool'

module Lotto
  module Domain
    class LotteryAnalyzer
      def self.analyze(lines, tens_per_group = 6)
        all_counts = {}

        lines.each do |line|
          line.split(' ').each do |number|
            all_counts[number] = (all_counts[number] || 0) + 1
          end
        end

        # Sort by frequency and group
        sorted = all_counts.sort_by { |_num, count| count }.reverse.to_h.keys
        sorted.each_slice(tens_per_group).map do |group|
          group.sort { |a, b| a.to_i <=> b.to_i }
        end
      end
    end
  end
end
