class AddressFinder
  def initialize(api = HackneyApi.new)
    @api = api
  end

  def find(postcode)
    properties = @api.list_properties(postcode: postcode)
    properties.map do |property|
      Property.new(
        property['propertyReference'],
        property['address'],
        property['postcode'],
      )
    end
  end

  Property = Struct.new(:property_reference, :address, :postcode)
end
