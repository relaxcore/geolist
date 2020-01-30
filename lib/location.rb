# frozen_string_literal: true

require 'csv'
require 'iso_country_codes'

module Location
  DATA_FILE = File.join(__dir__, 'data.csv')

  # position in CSV file
  COUNTRY_NAME = 5
  CITY         = 10

  def self.countries
    ::IsoCountryCodes.all.map { |country| { name: country.name, alpha2: country.alpha2, alpha3: country.alpha3 } }
  end

  def self.cities(country_name)
    return [] if country_name&.empty?
    return ['Hong Kong'] if country_name == 'Hong Kong'

    data.select { |row| row[COUNTRY_NAME] == country_name }.map { |row| row[CITY] }.uniq.compact.sort
  end

  def self.suburbs(city)
    return [] unless city == 'Hong Kong'

    data.select { |row| row[COUNTRY_NAME] == city }.map { |row| row[CITY] }.uniq.compact.sort
  end

  def self.get(country = nil, city = nil, _suburb = nil)
    return countries       if country.nil?
    return cities(country) if city.nil?

    suburbs(city)
  end

  def self.data
    @data ||= CSV.read(DATA_FILE)
  end
end
