# frozen_string_literal: true

require 'dry/cli'
require 'tty/spinner'
require 'lotto/domain/web_scraper'
require 'lotto/data/file_handler'
require 'lotto/domain/fiber_pool'

module Lotto
  module CLI
    module Commands
      class LoadTens < Dry::CLI::Command
        desc "Load lottery data from web"

        LOTTO_START_YEAR = 1996

        def call(*)
          spinner = TTY::Spinner.new("[:spinner] Loading lottery data...")
          spinner.auto_spin

          current_year = DateTime.now.year
          years = (LOTTO_START_YEAR..current_year).to_a

          # Clear existing data
          Data::FileHandler.clear("lotto.txt")

          # Fetch years and write to file
          years.each do |year|
            data = Domain::WebScraper.fetch_year_data(year)
            data.each do |tens|
              Data::FileHandler.append("lotto.txt", tens.join(' '))
            end
          end

          spinner.success("(Lottery data loaded)")
        end
      end
    end
  end
end
