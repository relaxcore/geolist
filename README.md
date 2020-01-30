# location ruby gem

**location** is a very simple ruby gem to get a list countries, cities and suburbs of the world.

## Put this gem at your Gemfile:
```ruby
gem 'location', git: 'https://github.com/relaxcoredev/location.git', branch: 'develop'
```

## List of countries:
```ruby
Location.countries
# [{:name=>"Australia", :alpha2=>"AU", :alpha3=>"AUS"}, ...]
```

## List of cities:
```ruby
Location.cities('Australia')
# => ["Adak", "Akhiok", "Akiachak", "Akiak", "Akutan", "Alakanuk", ...]
```

## List of suburbs (only for Hong Kong):
```ruby
Location.suburbs('Hong Kong')
# ["Aberdeen", "Causeway Bay", "Central District","Cha Kwo Ling", "Chai Wan Kok", "Chek Chue", ...]
```

## Simplified syntax with *get* method:
* _Location.get_: list of countries (equivalent to `Location.countries`)
* _Location.get(country)_: list of cities (equivalent to `Location.cities(country)`)
* _Location.get(country, city)_: list of suburbs (equivalent to `Location.suburbs(city)`)