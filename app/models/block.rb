class Block
  include ActiveModel::Model

  attr_accessor :propertyReference, :postcode, :address, :managerName,
                :managerPhone, :managerEmail, :floors, :entranceDoors, :lifts,
                :heating

  def self.find_by_dwelling(dwelling_reference)
    new_from_json(HackneyApi.new.get_block_for_dwelling(dwelling_reference))
  end

  def self.new_from_json(json)
    new(json)
  end
end
