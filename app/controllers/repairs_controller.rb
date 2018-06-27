class RepairsController < ApplicationController
  before_action :find_property
  def index
    @repairs = Repair.find_all_by_property_reference(@property.propertyReference)
  end

  def show
    @repair = Repair.find(params[:id])
  end

  private
  def find_property
    @property = Dwelling.find(property_reference: params[:property_id])
  end
end
