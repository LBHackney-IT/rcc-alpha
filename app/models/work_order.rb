class WorkOrder
  include ActiveModel::Model

  attr_accessor :supplierReference, :workOrderReference, :estimatedCost,
                :repairType, :status, :dueDate, :expectedCompletion, :attendedDate,
                :attendedBy, :outcome, :cancelledDate, :sorCode, :tasks

  def self.new_from_json(json)
    json['tasks'] = json['tasks'].map do |task_json|
      Task.new_from_json(task_json)
    end
    json['dueDate'] = DateTime.parse(json['dueDate']) if json['dueDate'].present?
    json['expectedCompletion'] = DateTime.parse(json['expectedCompletion']) if json['expectedCompletion'].present?
    json['attendedDate'] = DateTime.parse(json['attendedDate']) if json['attendedDate'].present?
    json['cancelledDate'] = DateTime.parse(json['cancelledDate']) if json['cancelledDate'].present?
    new(json)
  end

  def completed?
    self.status == 'Completed'
  end

  def in_progress?
    self.status == 'In Progress'
  end

  def cancelled?
    self.status == 'Cancel Order'
  end

  def progress_class_name
    case self.status
    when 'Completed'
      'completed'
    when 'In Progress'
      'progress'
    when 'Cancel Order'
      'cancelled'
    else
      'unknown'
    end
  end

  def trades
    tasks.collect {|t| t.trade}.uniq
  end
end
