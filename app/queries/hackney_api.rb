class HackneyApi
  def initialize(json_api = JsonApi.new)
    @json_api = json_api
  end

  def list_properties(postcode:)
    response = @json_api.get(
      'hackneyrepairs/v1/properties?postcode=' + postcode
    )
    response.fetch('results')
  end

  def get_property(property_reference:)
    @json_api.get('hackneyrepairs/v1/properties/' + property_reference)
  end

  def get_estate_for_dwelling(property_reference:)
    @json_api.get('hackneyrepairs/v1/properties/' + property_reference + '/estate')
  end

  def get_block_for_dwelling(property_reference:)
    @json_api.get('hackneyrepairs/v1/properties/' + property_reference + '/block')
  end

  def find_residents_by_property_reference(property_reference:)
    response = @json_api.get(
      'hackneyrepairs/v1/properties/' +
      property_reference +
      '/residents'
    )
    response.fetch('residents')
  end

  def find_repairs_by_property_reference(property_reference:)
    response = @json_api.get(
      'hackneyrepairs/v1/properties/' +
      property_reference +
      '/repairs'
    )
    response.fetch('repairs')
  end

  def create_repair(repair_params)
    @json_api.post('hackneyrepairs/v1/repairs', repair_params)
  end

  def get_repair(repair_request_reference:)
    @json_api.get('hackneyrepairs/v1/repairs/' + repair_request_reference)
  end

  def list_available_appointments(work_order_reference:)
    response = @json_api.get(
      'hackneyrepairs/v1/work_orders/' +
      work_order_reference +
      '/available_appointments'
    )
    response.fetch('results')
  end

  def book_appointment(work_order_reference:, begin_date:, end_date:)
    @json_api.post(
      'hackneyrepairs/v1/work_orders/' + work_order_reference + '/appointments',
      beginDate: begin_date,
      endDate: end_date
    )
  end
end
