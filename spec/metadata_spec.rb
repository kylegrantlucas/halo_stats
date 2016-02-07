require 'spec_helper'

describe HaloStats::Metadata do
  let (:metadata_client) {HaloStats::Metadata.new(api_key: 'fakekey')}

  context 'get' do
    it 'returns a hash for get_matches' do
      expect(metadata_client.get_weapons).to be_a(Hash)
    end
  end
end
