require 'spec_helper'

describe HerePlaces::Suggest do
  let(:object) { described_class.new }
  let(:data) { { test: 'stuff' } }

  it 'responds correctly to suggest method and delegates to the api call' do
    resource_url = "#{API_PREFIX}/suggest"

    expect(object).to respond_to(:suggest)
    expect(object).to receive(:api).with(resource_url, data)

    object.suggest(data)
  end
end