require 'spec_helper'

describe HerePlaces::Suggest do
  let(:api) { described_class.new }
  let(:payload) { { at: '52.5159,13.3777', q: 'berl' } }

  it "calls the api and returns results correctly" do
    VCR.use_cassette("suggest", record: :once) do
      results = api.suggest(payload)
      expect(results["suggestions"][0]).to eq "Berlin, Germany"
    end
  end
end
