class Resident
  include ActiveModel::Model

  attr_accessor :residentReference, :name, :last_call

  def self.find_all_by_property_reference(dwelling_reference)
    HackneyApi.new.find_residents_by_property_reference(dwelling_reference).collect do |x|
      new_from_json(x)
    end
  end

  def self.new_from_json(json)
    new(json)
  end
end
