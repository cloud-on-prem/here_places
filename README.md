# HerePlaces
A wafer-thin Ruby wrapper for accessing Nokia's Here Maps Places API.  
Read more about the official API here: <http://developer.here.net/>


## Installation

Add this line to your application's Gemfile:

    gem 'here_places'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install here_places

* * *

## Getting Started

The aim of this gem is to provide a ruby wrapper around the REST APIs that **Here** provides. Read more about the APIs here: <http://developer.here.net/docs/places/topics/resources.html>

To start using the APIs, register for a Nokia Developer Account <http://developer.here.net/> to get your APP\_ID and APP\_CODE

* * *

### Discover API 

#### Searching <http://developer.here.net/docs/places/topics/resource-search.html>  

The search resource represent sets of places that match a user's search term in a specific location context (such as near a given location, around a user's current position or on the currently visible map).

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    data = {
      q: 'Cafe',
      at: '40.74917,-73.98529',
    }
    api = HerePlaces::Discover.new(app_id, app_code)
    a = api.search(data)

#### Exploring <http://developer.here.net/docs/places/topics/resource-explore.html>  

The explore resource represent sets of popular places within a specific location context. The explore resource allows users to explore places without typing search queries. An explore resource's location context might be an explicitly given location or implicitly defined by a user's current position or the currently visible map. Optionally, the places may be restricted to a given set of categories.
`at` and `in` parameter are mutually exclusive and can't be passed at the same time

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    data = {
      cat: 'natural-geographical',
      at: '40.74917,-73.98529',
    }
    api = HerePlaces::Discover.new(app_id, app_code)
    a = api.explore(data)
    
#### Here <http://developer.here.net/docs/places/topics/resource-discover-here.html>  

The discover here resource represent sets of places within a specific location context. The Discover Here resource allows users to request places near to a given point, based on a location precision parameter which must be provided. If the precision is high, the places around that point are returned in order of proximity. Otherwise, a set of recommended places in the area is returned.

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    data = {
      cat: 'natural-geographical',
      at: '40.7063,-73.9971;u=0',
    }
    api = HerePlaces::Discover.new(app_id, app_code)
    a = api.here(data)

* * *

### Places 

#### The Place Resource <http://developer.here.net/docs/places/topics/resource-discover-here.html>  

The place resource represent places on earth.
Examples for places include:
Places of (public) interest (POI)
Addresses of buildings (Locations)
Named areas and regions
Each place is referenced by an identifier, called a placeId.

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    id = '840dr5rs-5c0f37fabdc643938dd4f47db00d4ae8'
    api = HerePlaces::Place.new(app_id, app_code)
    a = api.places(id)

* * *
        
### Suggestions

#### The Search Suggestion Resource <http://developer.here.net/docs/places/topics/resource-suggest.html>  

The search suggestions resource represents lists of suggested search terms related to a given (partial) search term and location context.

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    data = {
      q: 'restaur',
      at: '40.7063,-73.9971',
    }
    api = HerePlaces::Suggest.new(app_id, app_code)
    a = api.suggest(data)

* * *

### Categories

#### The Category Graph Resource <http://developer.here.net/docs/places/topics/resource-category-graph.html>  

The category graph resource represents sets of locally relevant categories that are organized in a graph-like hierarchy. The category graph may change at any point in the future and may be different depending on the location of the request. A set of permanent, top-level, categories can be found [here](http://developer.here.net/docs/places/topics/categories.html).

    require 'here_places'
    app_id = "YOUR_APP_ID"
    app_code = "YOUR_APP_CODE"
    data = {
      at: '40.7063,-73.9971',
    }
    api = HerePlaces::Category.new(app_id, app_code)
    a = api.places(data)

* * *

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

* * *

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
