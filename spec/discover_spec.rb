require 'spec_helper'

describe HerePlaces::Discover do
  let(:object) { described_class.new }
  let(:data) { { test: 'stuff' } }

  %w(search explore here).each do |meth|
    it "responds correctly to #{meth} and delegates to the api call" do
      resource_url = "#{API_PREFIX}/discover/#{meth}"

      expect(object).to respond_to(meth)
      expect(object).to receive(:api).with(resource_url, data)

      object.send(meth.to_sym, data)
    end
  end
end