require 'spec_helper'

describe HerePlaces::Base do
  let(:object) { described_class.new }
  let(:app_id) { 'APP_ID' }
  let(:app_code) { 'APP_CODE' }

  context "after initialize" do
    it 'calls the setup method' do
      expect_any_instance_of(described_class).to receive(:setup)
      object
    end
  end

  context "the setup method" do
    it "correctly sets up the Faraday connection object" do
      expect(object.conn).to be_an_instance_of(Faraday::Connection)
    end
  end

  context "api method" do
    let(:url_fragment) { 'some/url/fragment' }
    let(:data) { { test: 'stuff' } }

    after(:each) do
      FakeWeb.clean_registry
    end

    it "correctly constructs the API URL and makes calls" do
      FakeWeb.register_uri(:get, %r|^http:\/\/places\.nlp\.nokia\.com\/.*|, :body => {test: 'stuff'}.to_json)
      object.api(url_fragment, data)
      parametrized_data = URI.encode_www_form(data)
      expect(FakeWeb.last_request.path).
        to eq("/#{url_fragment}?app_code=#{app_code}&app_id=#{app_id}&#{parametrized_data}")
    end

    it "flips out and raises error when it receives an API error" do
      FakeWeb.register_uri(:get, %r|^http:\/\/places\.nlp\.nokia\.com\/.*|, :body => {status: 400, stuff: 'test'}.to_json)
      expect{object.api(url_fragment, data)}.to raise_error(HerePlaces::APIError)
    end
  end
end
