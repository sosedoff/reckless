# Reckless

Ruby client to Chicago's records store Reckless.com

[![Build Status](https://travis-ci.org/sosedoff/reckless.png?branch=master)](https://travis-ci.org/sosedoff/reckless)
[![Code Climate](https://codeclimate.com/github/sosedoff/reckless.png)](https://codeclimate.com/github/sosedoff/reckless)

## Installation

Add it to your Gemfile:

```
gem "reckless"
```

Or install it manually:

```
gem install reckless
```

## Usage

See examples:

```ruby
require "reckless"

# Search for records
search = Reckless.search("Nirvana")
search = Reckless.recent_arrivals

# Get search details
search.url           # http://www.reckless.com/index.phpkeywords=&format=&cond=&store=&is_search=true&srch=Search
search.total_pages   # 15
search.total_results # 450
search.page          # 1
search.results       # returns an array of results
```

Each search result is a simple hash:

```ruby
{
  :artist    => "13th Floor Elevators",
  :title     => "Easter Everywhere (180g, Reissue)",
  :label     => "International Artist",
  :price     => 11.99,
  :type      => "New LP",
  :condition => "Good Condition",
  :location  => "Milwaukee Ave"
}
```

Or you can access it as an object:

```ruby
item = Reckless.search("Nirvana").results.first

item.artist
item.title
item.label
item.price
item.type
item.condition
item.location
```

### Search options

- `page`      - Specify a page to fetch. Defaults to `1`
- `format`    - Choose record format: `LP`, `CD`, `DVD`. Defaults to `LP`
- `location`  - Choose location: `Broadway`, `Milwaukee` or `Loop`. Does not have a default.
- `condition` - Specify record condition: `U` - Used, `N` - New.

## Testing

Execute test suite:

```
bundle exec rake test
```

### License

The MIT License (MIT)

Copyright (c) 2014 Dan Sosedoff, <dan.sosedoff@gmail.com>
