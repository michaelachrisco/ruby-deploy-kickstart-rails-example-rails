require 'spec_helper'

describe Free::Pizza do
  let(:free_pizza) { Free::Pizza.new(google_api_key, city) }
  describe '#call' do
    subject do
      VCR.use_cassette(cassette) do
        free_pizza.call
      end
    end

    context 'when successful' do
      let(:cassette) { 'fresno' }
      let(:city) { 'Fresno' }
      let(:google_api_key) { '12345' }
      its('first.keys') do
        is_expected.to include :description,
                               :id,
                               :matched_substrings,
                               :place_id,
                               :reference,
                               :terms,
                               :types
      end
    end
  end
end
