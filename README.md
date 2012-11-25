# HerePlaces

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'here_places'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install here_places

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# data = {
#   at: '40.74917,-73.98529',
#   tf: 'plain',
#   pretty: 'true',
#   size: 2
# }
# a["status"]

require "./lib/here_places.rb"
app_id = "lKjK3TMTHGVvDA0cw0tB"
app_code = "nC9rK7Nf7znEmVhQz-xWKA"
data = {
  q: 'Cafe',
  at: '40.74917,-73.98529',
}
h = HerePlaces::Discover.new(app_id, app_code)
a = h.search(data)