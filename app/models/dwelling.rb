class Dwelling
  include ActiveModel::Model

  attr_accessor :propertyReference, :postcode, :address, :maintainable,
                :floor, :residents, :heating, :toilets, :bathrooms

  def self.find(dwelling_reference)
    new_from_json(HackneyApi.new.get_property(dwelling_reference))
  end

  def self.new_from_json(json)
    new(json)
  end
end
