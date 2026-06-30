# frozen_string_literal: true

module Lotto
  module Domain
    class RactorPool
      def initialize(size: 4, &block)
        @size = size
        @ractor_block = block
        @ractors = Array.new(@size) do
          Ractor.new(&block)
        end
      end

      def map(items)
        results = []
        queue = items.dup

        loop do
          available = Ractor.select(*@ractors)
          break if available.empty? && queue.empty?

          next if available.empty?

          item = queue.shift
          break if item.nil?

          ractor = available.first
          ractor.send(item)
        end

        results = @ractors.map(&:take)
        results.flatten.compact
      end

      def shutdown
        @ractors.each(&:terminate)
      end
    end
  end
end
