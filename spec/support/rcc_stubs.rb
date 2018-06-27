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

  def stub_property_find
    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties/000001").
    to_return(
      status: 200,
      body: {
        address: "Hackney Block",
        postcode:"E58TE",
        propertyReference:"000001",
        maintainable:true,
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
        propertyReference:"E00001",
        managerName:"Jane Smith",
        managerEmail:"janes@test.com",
        managerPhone:"07777777778",
      }.to_json,
      headers: {},
    )
  end

  def stub_residents_for_property(residents=nil)
    residents = residents || [
      {
        residentReference: "83647",
        name: "Jim Resident",
        last_call: 2.days.ago,
      },
      {
        residentReference: "83648",
        name: "Janet Resident",
      },
    ]

    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties/000001/residents").
    to_return(
      status: 200,
      body: {
        "residents": residents
      }.to_json,
      headers: {},
    )
  end

  def stub_repairs_for_property(repairs=nil)
    repairs = repairs || [
      repair_json,
      repair_json(
        problemDescription: 'Loose toilet seat',
        repairRequestReference: '477953',
      )
    ]

    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/properties/000001/repairs").
    to_return(
      status: 200,
      body: {
        "repairs": repairs
      }.to_json,
      headers: {},
    )
  end

  def stub_repair_find(repair_overrides={})
    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/repairs/23487").
    to_return(
      status: 200,
      body: repair_json(repair_overrides).to_json,
      headers: {},
    )
  end

  def stub_inprogress_repair_find(repair_overrides={})
    stub_request(:get, "http://localhost:3000/hackneyrepairs/v1/repairs/23487").
    to_return(
      status: 200,
      body: repair_json(inprogress_repair_json).to_json,
      headers: {},
    )
  end

  private

  def repair_json(overrides={})
    {
      repairRequestReference: "23487",
      propertyReference: "000001",
      problemDescription: "Broken Light",
      priority: "I",
      contact: {
        name: 'Test Name',
        phone: '077777777',
      },
      workOrders: [
        completed_work_order_json,
      ],
    }.merge(overrides)
  end

  def inprogress_repair_json(overrides={})
    {
      repairRequestReference: "23487",
      propertyReference: "000001",
      problemDescription: "Stuck Door Handle",
      priority: "E",
      contact: {
        name: 'Test Name',
        phone: '077778777',
      },
      workOrders: [
        inprogress_work_order_json,
      ],
    }.merge(overrides)
  end

  def completed_work_order_json(overrides={})
    {
      sorCode: "20040020",
      supplierReference: "W1",
      workOrderReference: "387475",
      estimatedCost: 10.5,
      repairType: "Community Hall Repairs",
      status: "Completed",
      dueDate: "2018-06-18T09:00:00Z",
      expectedCompletion: "2018-06-18T09:00:00Z",
      attendedDate: "2018-06-18T09:00:00Z",
      attendedBy: "Geoff Smith",
      outcome: "Job Physically Complete",
      cancelledDate: nil,
      tasks: [
        completed_task_json,
      ],
    }
  end

  def inprogress_work_order_json(overrides={})
    {
      sorCode: "20040020",
      supplierReference: "W1",
      workOrderReference: "387475",
      estimatedCost: 10.5,
      repairType: "Community Hall Repairs",
      status: "In Progress",
      dueDate: "2018-06-18T09:00:00Z",
      expectedCompletion: "2018-06-18T09:00:00Z",
      attendedDate: nil,
      attendedBy: nil,
      outcome: nil,
      cancelledDate: nil,
      tasks: [
        inprogress_task_json,
      ],
    }
  end

  def completed_task_json(overrides={})
    {
      sorCode: "20040020",
      dueDate: "2018-06-18T09:00:00Z",
      supplierReference: "W1",
      estimatedCost: 10.5,
      trade: "SW",
      completedDate: "2018-06-18T09:00:00Z",
      description: "12 mm bitumen impregnated brds: laid ,loose",
    }
  end

  def inprogress_task_json(overrides={})
    completed_task_json(completedDate: nil)
  end
end
