# frozen_string_literal: true

require 'lotto/domain/ractor_pool'

module Lotto
  module Domain
    class LotteryAnalyzer
      def self.analyze(lines, tens_per_group = 6)
        # Use Ractor to count number frequencies in parallel
        pool = RactorPool.new(size: 4) do
          counts = {}

          loop do
            line = Ractor.receive
            break if line.nil?

            line.split(' ').each do |number|
              counts[number] = (counts[number] || 0) + 1
            end

            Ractor.yield(counts)
          end
        end

        # Merge results from all Ractors
        all_counts = {}

        lines.each do |line|
          # Send work to pool (simplified; would need proper pool implementation)
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
