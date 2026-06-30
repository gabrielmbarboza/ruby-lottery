# frozen_string_literal: true

module Lotto
  module Data
    class FileHandler
      def self.write(filename, content)
        File.write(filename, content)
      end

      def self.read_lines(filename)
        File.readlines(filename).map(&:chomp)
      end

      def self.clear(filename)
        File.truncate(filename, 0) if File.exist?(filename)
      end

      def self.append(filename, content)
        File.open(filename, 'a') { |f| f.puts(content) }
      end
    end
  end
end
