require 'spec_helper'

describe HerePlaces::Discover do
  before(:each) do
    app_id = 'APP_ID'
    app_code = 'APP_CODE'
    @data = {test: 'stuff'}
    @h = HerePlaces::Discover.new(app_id, app_code)
    @h.stub!(:api)
  end

  %w(search explore here).each do |meth|
    it "responds correctly to #{meth} and delegates to the api call" do
      resource_url = "#{API_PREFIX}/discover/#{meth}"
      @h.should respond_to(meth.to_sym)
      @h.should_receive(:api).with(resource_url, @data)
      @h.send(meth.to_sym, @data)
    end
  end
end