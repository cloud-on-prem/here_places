require 'spec_helper'

describe HerePlaces::Category do
  let(:api) { described_class.new }
  let(:payload) { { at: '52.5159,13.3777', cat: 'sights-museums' } }

  it "calls the api and returns results correctly" do
    VCR.use_cassette("categories", record: :once) do
      results = api.places(payload)
      expect(results["items"][0]["title"]).to eq "Eat & Drink"
    end
  end

end
