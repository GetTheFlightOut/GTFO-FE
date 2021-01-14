describe 'Flights Service' do
  it 'can return flight search' do
    json1 = File.read('spec/fixtures/request_id_return.json')
    json2 = File.read('spec/fixtures/flights.json')
    json3 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=01/30/2021&limit=20&trip_duration=5&uid'
    json1_parsed = JSON.parse(json1, symbolize_names: true)

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json1, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/requests/#{json1_parsed[:data][:request_id]}")
        .to_return(status: 200, body: json2, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/1864")
        .to_return(status: 200, body: json3, headers: {})
    end

    query_params = {
              :departure_airport => 'DEN',
              :departure_date => '01/30/2021',
              :trip_duration => 5,
              :limit => 20
              }

    response = BackendService.trips_search(query_params)

    expect(response).to be_an(Hash)
    expect(response[:data][:request_id]).to eq(json1_parsed[:data][:request_id])
  end

  it 'can return trip search' do
    json1 = File.read('spec/fixtures/request_id_return.json')
    json2 = File.read('spec/fixtures/flights.json')
    json3 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=01/30/2021&limit=20&trip_duration=5&uid'
    json1_parsed = JSON.parse(json1, symbolize_names: true)

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json1, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/requests/#{json1_parsed[:data][:request_id]}")
        .to_return(status: 200, body: json2, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/1864")
        .to_return(status: 200, body: json3, headers: {})
    end

    query_params = {
              :departure_airport => 'DEN',
              :departure_date => '01/30/2021',
              :trip_duration => 5,
              :limit => 20
              }

    response = BackendService.get_request_data(json1_parsed[:data][:request_id])

    expect(response).to be_an(Hash)
    expect(response[:included]).to be_a(Array)

    expect(response[:included][0]).to have_key(:id)
    expect(response[:included][0][:id]).to be_a(String)

    expect(response[:included][0]).to have_key(:attributes)
    expect(response[:included][0][:attributes]).to be_an(Hash)

    expect(response[:included][0][:attributes]).to have_key(:price)
    expect(response[:included][0][:attributes][:price]).to be_an(Integer)
  end
end
