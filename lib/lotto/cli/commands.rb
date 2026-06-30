# frozen_string_literal: true

require 'dry/cli'
require 'lotto/cli/commands/version'
require 'lotto/cli/commands/load_tens'
require 'lotto/cli/commands/lucky_numbers'
require 'lotto/cli/commands/random_tens'

module Lotto
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "load", LoadTens
      register "lucky", LuckyNumbers
      register "random", RandomTens
    end
  end
end
