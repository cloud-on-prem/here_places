require 'spec_helper'

describe HerePlaces::Base do
  before(:each) do
    @app_id = 'APP_ID'
    @app_code = 'APP_CODE'
  end

  context "after initialize" do
    it 'calls the setup method' do
      HerePlaces::Base.any_instance.stub(:setup)
      HerePlaces::Base.any_instance.should_receive(:setup)
      @h = HerePlaces::Base.new(@app_id, @app_code)
    end
  end

  context "the setup method" do
    it "correctly sets up the Faraday connection object" do
      @h = HerePlaces::Base.new(@app_id, @app_code)
      @h.conn.should be_an_instance_of(Faraday::Connection)
    end
  end

  context "api method" do
    before(:each) do
      @url_fragment = 'some/url/fragment'
      @data = {test: 'stuff'}
    end

    after(:each) do
      FakeWeb.clean_registry
    end

    it "correctly constructs the API URL and makes calls" do
      @h = HerePlaces::Base.new(@app_id, @app_code)
      FakeWeb.register_uri(:get, %r|^http:\/\/places\.nlp\.nokia\.com\/.*|, :body => {stuff: 'test'}.to_json)
      @h.api(@url_fragment, @data)
      @parametrized_data = URI.encode_www_form(@data)
      FakeWeb.last_request.path.should eq("/#{@url_fragment}?app_id=#{@app_id}&app_code=#{@app_code}&#{@parametrized_data}")
    end

    it "flips out and raises error when it receives an API error" do
      @h = HerePlaces::Base.new(@app_id, @app_code)
      FakeWeb.register_uri(:get, %r|^http:\/\/places\.nlp\.nokia\.com\/.*|, :body => {status: 400, stuff: 'test'}.to_json)
      expect {@h.api(@url_fragment, @data)}.to raise_error(HerePlaces::APIError)
    end
  end

end