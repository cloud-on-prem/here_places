require 'spec_helper'

describe HerePlaces::Suggest do
  before(:each) do
    app_id = 'APP_ID'
    app_code = 'APP_CODE'
    @data = {test: 'stuff'}
    @h = HerePlaces::Suggest.new(app_id, app_code)
    @h.stub!(:api)
  end

  it 'responds correctly to suggest method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/suggest"
    @h.should respond_to(:suggest)
    @h.should_receive(:api).with(resource_url, @data)
    @h.suggest(@data)
  end
end