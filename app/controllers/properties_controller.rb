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
end
