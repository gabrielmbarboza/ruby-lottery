# frozen_string_literal: true

module Lotto
  module Domain
    class FiberPool
      def initialize(size: 4, &block)
        @size = size
        @block = block
      end

      def map(items)
        return [] if items.empty?

        results = []
        fibers = []

        items.each do |item|
          fiber = Fiber.new do
            @block.call(item)
          end
          fibers << fiber
        end

        # Resume fibers in batches to simulate concurrency
        fibers.each_slice(@size) do |batch|
          batch.each do |fiber|
            fiber.resume if fiber.alive?
          end
        end

        results
      end

      def shutdown
        # Fiber cleanup (minimal needed)
      end
    end
  end
end
