require 'rubygems'
require 'bundler'
require 'rspec'
require 'fakeweb'
require 'here_places'

BASE_URL = 'http://places.nlp.nokia.com/'
API_PREFIX = 'places/v1'

RSpec.configure do |config|
  config.before(:all) do
    HerePlaces.set_keys('APP_ID', 'APP_CODE')
  end
end
