require 'spec_helper'

describe "Error" do
  let(:api) { HerePlaces::Suggest.new }
  let(:payload) { { q: 'berl' } }

  it "calls the api and returns results correctly" do
    VCR.use_cassette("suggest-bad", record: :once) do
      expect{
        api.suggest(payload)
      }.to raise_error HerePlaces::APIError
    end
  end
end
