class Repair
  include ActiveModel::Model

  attr_accessor :repairRequestReference, :propertyReference, :problemDescription,
                :priority, :contactName, :contactPhone, :workOrders

  def self.find_all_by_property_reference(dwelling_reference)
    HackneyApi.new.find_repairs_by_property_reference(property_reference: dwelling_reference).collect do |x|
      new_from_json(x)
    end
  end

  def self.find(repairRequestReference)
    response = HackneyApi.new.get_repair(repair_request_reference: repairRequestReference)
    new_from_json(response)
  end

  def self.new_from_json(json)
    json['contactName'] = json['contact']['name']
    json['contactPhone'] = json['contact']['phone']
    json.delete('contact')
    json['workOrders'] = json['workOrders'].map do |work_order_json|
      WorkOrder.new_from_json(work_order_json)
    end
    new(json)
  end

  def priority_text
    case self.priority
    when 'E'
      'Emergency'
    when 'G'
      'Gas Servicing'
    when 'I'
      'Immediate'
    when 'N'
      'Normal'
    when 'O'
      'Out of hours'
    when 'P'
      'Planned Maintenance'
    when 'U'
      'Urgent'
    else
      self.priority
    end
  end

  def trades
    workOrders.collect {|wo| wo.tasks.collect {|t| t.trade}}.flatten.uniq
  end
end
