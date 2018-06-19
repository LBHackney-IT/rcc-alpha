class Repair
  include ActiveModel::Model

  attr_accessor :repairRequestReference, :propertyReference, :problemDescription,
                :priority

  def self.find_all_by_property_reference(dwelling_reference)
    HackneyApi.new.find_repairs_by_property_reference(property_reference: dwelling_reference).collect do |x|
      new_from_json(x)
    end
  end

  def self.new_from_json(json)
    json.delete('contact')
    json.delete('workOrders')
    new(json)
  end
end
