require 'spec_helper'
require 'app/queries/address_finder'

RSpec.describe AddressFinder do
  describe '.find' do
    it 'calls out to an api' do
      api = spy

      AddressFinder.new(api).find('N1 6NU')

      expect(api).to have_received(:list_properties).with(postcode: 'N1 6NU')
    end

    it 'wraps the result of the api call in an object' do
      api_result = [
        {
          'propertyReference' => 'P01234',
          'address' => 'Flat 1, 8 Hoxton Square',
          'postcode' => 'N1 6NU',
        },
      ]
      api = double(list_properties: api_result)

      result = AddressFinder.new(api).find('N1 6NU')

      expect(result.first.property_reference).to eq 'P01234'
      expect(result.first.address).to eq 'Flat 1, 8 Hoxton Square'
    end
  end
end
