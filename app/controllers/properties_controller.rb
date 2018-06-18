class PropertiesController < ApplicationController
  def index
    if params[:post_code]
      @properties = AddressFinder.new.find(params[:post_code])
      if @properties.present?
        @block = Block.find_by_dwelling(property_reference: @properties.first.property_reference)
        @estate = Estate.find_by_dwelling(property_reference: @properties.first.property_reference)
      end
    end
  end

  def show
    @property = Dwelling.find(property_reference: params[:id])
    @block = Block.find_by_dwelling(property_reference: params[:id])
    @estate = Estate.find_by_dwelling(property_reference: params[:id])
    @residents = Resident.find_all_by_property_reference(property_reference: params[:id])
  end
end
