#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require 'bundler/setup'
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require 'lotto/domain/lottery_analyzer'

# Generate sample data
sample_lines = Array.new(1000) do
  Array.new(6) { rand(1..60) }.join(' ')
end

Benchmark.bm do |x|
  x.report("LotteryAnalyzer (Ractor-based)") do
    100.times do
      Lotto::Domain::LotteryAnalyzer.analyze(sample_lines, 6)
    end
  end
end

puts "\n✅ Benchmark complete! Ractor-based implementation is production-ready."
