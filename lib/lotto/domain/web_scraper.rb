# frozen_string_literal: true

require 'mechanize'

module Lotto
  module Domain
    class WebScraper
      BASE_URL = "https://asloterias.com.br/resultados-da-mega-sena"
      SELECTOR = ".dezenas_mega"
      
      def self.fetch_year_data(year)
        agent = Mechanize.new
        url = "#{BASE_URL}-#{year}"
        page = agent.get(url)

        raw_numbers = page.search(SELECTOR)
        raw_numbers.each_slice(6).map do |tens|
          tens.map(&:children).join(' ').split(' ')
        end
      rescue StandardError => e
        warn "Failed to fetch year #{year}: #{e.message}"
        []
      end
    end
  end
end
