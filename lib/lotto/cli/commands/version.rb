# frozen_string_literal: true

require 'lotto/version'

module Lotto
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts Lotto::VERSION
        end
      end
    end
  end
end
