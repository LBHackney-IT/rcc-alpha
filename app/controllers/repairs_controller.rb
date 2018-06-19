class RepairsController < ApplicationController
  before_action :find_property
  def index
    @repairs = Repair.find_all_by_property_reference(@property.propertyReference)
  end

  private
  def find_property
    @property = Dwelling.find(property_reference: params[:property_id])
  end
end
