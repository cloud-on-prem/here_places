require 'spec_helper'

describe HerePlaces::Discover do
  let(:api) { described_class.new }
  let(:payload) { { at: '52.5159,13.3777'} }

  %w(explore here).each do |meth|
    describe meth do
      it "calls the api and returns results correctly" do
        VCR.use_cassette("#{meth}", record: :once) do
          results = api.send(:"#{meth}", payload)
          expect(results["results"]["items"].count).to be > 0
        end
      end
    end
  end

  describe "search" do
    let(:payload) { { at: '52.5159,13.3777', q: 'Cafe'} }

    it "calls the api and returns results correctly" do
      VCR.use_cassette("search", record: :once) do
        results = api.search(payload)
        expect(results["results"]["items"].count).to be > 0
      end
    end
  end
end
