require 'spec_helper'

describe HerePlaces::Place do
  before(:each) do
    app_id = 'APP_ID'
    app_code = 'APP_CODE'
    @id = '123asdfa'
    @h = HerePlaces::Place.new(app_id, app_code)
    @h.stub!(:api)
  end

  it 'responds correctly to places method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/places/#{@id}"
    @h.should respond_to(:places)
    @h.should_receive(:api).with(resource_url)
    @h.places(@id)
  end
end