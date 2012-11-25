require 'spec_helper'

describe HerePlaces::Category do
  before(:each) do
    app_id = 'APP_ID'
    app_code = 'APP_CODE'
    @data = {test: 'stuff'}
    @h = HerePlaces::Category.new(app_id, app_code)
    @h.stub!(:api)
  end

  it 'responds correctly to places method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/categories/places"
    @h.should respond_to(:places)
    @h.should_receive(:api).with(resource_url, @data)
    @h.places(@data)
  end
end