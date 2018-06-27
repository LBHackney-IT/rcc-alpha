class Task
  include ActiveModel::Model

  attr_accessor :sorCode, :dueDate, :supplierReference, :estimatedCost, :trade,
                :completedDate, :description

  def self.new_from_json(json)
    json['completedDate'] = DateTime.parse(json['completedDate']) if json['completedDate'].present?
    json['dueDate'] = DateTime.parse(json['dueDate']) if json['dueDate'].present?
    new(json)
  end

  def progress_class_name

  end

  def completed?
    self.completedDate.present?
  end

  def cancelled?
    false
  end
end
