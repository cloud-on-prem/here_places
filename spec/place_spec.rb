require 'spec_helper'

describe HerePlaces::Place do
  let(:object) { described_class.new }
  let(:id) { '123asdfa' }

  it 'responds correctly to places method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/places/#{id}"

    expect(object).to respond_to(:places)
    expect(object).to receive(:api).with(resource_url)

    object.places(id)
  end
end