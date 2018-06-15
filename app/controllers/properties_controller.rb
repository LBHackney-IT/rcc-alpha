class PropertiesController < ApplicationController
  def index
    if params[:post_code]
      @properties = AddressFinder.new.find(params[:post_code])
    end
  end
end
