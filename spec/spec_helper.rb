require 'rubygems'
require 'bundler'
require 'rspec'
require 'here_places'
require 'vcr'
require 'faraday'
require 'webmock'

RSpec.configure do |config|

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock
    c.filter_sensitive_data('<APP_ID>') { 'APP_ID' }
    c.filter_sensitive_data('<APP_CODE>') { 'APP_CODE' }
  end

  config.before(:all) do
    HerePlaces.set_keys('APP_ID', 'APP_CODE')
  end
end
