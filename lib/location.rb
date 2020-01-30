# frozen_string_literal: true

require 'csv'
require 'iso_country_codes'
require 'open-uri'
require 'zip'
require 'pry'

module GeoList
  class << self
    MAXMIND_URL    = 'https://download.maxmind.com/app/geoip_download'
    MAXMIND_PARAMS = '?edition_id=GeoLite2-City-CSV&suffix=zip&license_key=PC4n5BvdsNQK3w6m'
    MAXMIND_LINK   = MAXMIND_URL + MAXMIND_PARAMS

    DATA_FILE = File.join(__dir__, 'data.csv')

    # position in CSV file
    COUNTRY_NAME = 5
    CITY         = 10

    def update_data # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      downloaded_file = open(MAXMIND_LINK) # rubocop:disable Security/Open
      csv_filename    = 'GeoLite2-City-Locations-en.csv'

      Zip::File.open(downloaded_file) do |zip_file|
        zip_file.each do |file|
          next unless file.name.match?(/#{csv_filename}/)

          path = File.join(__dir__, csv_filename)
          zip_file.extract(file, path)
        end
      end

      FileUtils.rm(DATA_FILE) if File.exist?(DATA_FILE)
      File.rename File.join(__dir__, csv_filename), File.join(__dir__, 'data.csv')

      true
    end

    def countries
      ::IsoCountryCodes.all.map { |country| { name: country.name, alpha2: country.alpha2, alpha3: country.alpha3 } }
    end

    def cities(country_name)
      return [] if country_name&.empty?
      return ['Hong Kong'] if country_name == 'Hong Kong'

      data.select { |row| row[COUNTRY_NAME] == country_name }.map { |row| row[CITY] }.uniq.compact.sort
    end

    def suburbs(city)
      return [] unless city == 'Hong Kong'

      data.select { |row| row[COUNTRY_NAME] == city }.map { |row| row[CITY] }.uniq.compact.sort
    end

    def get(country = nil, city = nil, _suburb = nil)
      return countries       if country.nil?
      return cities(country) if city.nil?

      suburbs(city)
    end

    def data
      @data ||= CSV.read(DATA_FILE)
    end
  end
end
