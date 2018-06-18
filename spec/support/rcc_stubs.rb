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

  def stub_block_for_property
    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties/000001/block").
    to_return(
      status: 200,
      body: {
        address: "Hackney Block",
        postcode:"E58TE",
        propertyReference:"B00001",
        managerName:"Bob Smith",
        managerEmail:"test@test.com",
        managerPhone:"07777777777",
        floors:2,
        entranceDoors:1,
        lifts:1,
        heating:"Mixed",
      }.to_json,
      headers: {},
    )
  end

  def stub_estate_for_property
    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties/000001/estate").
    to_return(
      status: 200,
      body: {
        address: "Hackney Estate",
        postcode:"E58TE",
        propertyReference:"B00001",
        managerName:"Jane Smith",
        managerEmail:"janes@test.com",
        managerPhone:"07777777778",
      }.to_json,
      headers: {},
    )
  end
end
