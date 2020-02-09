**GeoList** is a very simple ruby gem to get a list of all countries, cities and suburbs.

## Install
```ruby
gem 'geolist', '~> 0.1.0'
```

## Examples

### List of countries:
```ruby
GeoList.countries
# [{:name=>"Australia", :alpha2=>"AU", :alpha3=>"AUS"}, ...]
```

### List of cities:
```ruby
GeoList.cities('Australia')
# => ["Adak", "Akhiok", "Akiachak", "Akiak", "Akutan", "Alakanuk", ...]
```

### List of suburbs (only for Hong Kong):
```ruby
GeoList.suburbs('Hong Kong')
# ["Aberdeen", "Causeway Bay", "Central District","Cha Kwo Ling", "Chai Wan Kok", "Chek Chue", ...]
```

### Simplified syntax with *get* method:
* _GeoList.get_: list of countries (equivalent to `GeoList.countries`)
* _GeoList.get(country)_: list of cities (equivalent to `GeoList.cities(country)`)
* _GeoList.get(country, city)_: list of suburbs (equivalent to `GeoList.suburbs(city)`)

### Geo data update

```ruby
GeoList.update_data

# Will update data file to the latest version (using MaxMind free databases)
# Can be added to migration or in some scheduler

# Database is updated weekly, every Tuesday.
```
