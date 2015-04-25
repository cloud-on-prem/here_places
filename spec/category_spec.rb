require 'spec_helper'

describe HerePlaces::Category do
  let(:object) { described_class.new }
  let(:data) { { test: 'stuff' } }

  it 'responds correctly to places method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/categories/places"
    
    expect(object).to respond_to(:places)
    expect(object).to receive(:api).with(resource_url, data)

    object.places(data)
  end
end