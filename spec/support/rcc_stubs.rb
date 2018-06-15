module RCCStubs
  def stub_property_search(addresses=nil)
    addresses = addresses || [
      {
        address: "1 Estate House",
        postcode: "E58TE",
        propertyReference: "000001"
      },
    ]

    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties?postcode=E5%208TE").
    to_return(
      status: 200,
      body: {
        "results": addresses
      }.to_json,
      headers: {},
    )
  end
end
