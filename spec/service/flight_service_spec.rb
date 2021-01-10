describe 'Flights Service' do
  it 'can return flight search' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=30/01/2021&trip_duration=5"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/api/v1/search#{query}").
            to_return(status: 200, body: json, headers: {})

    query_params = {
              :departure_airport => 'DEN',
              :departure_date => '30/01/2021',
              :trip_duration => 5
              }

    response = BackendService.trips_search(query_params)

    expect(response).to be_an(Hash)
    expect(response[:data]).to be_a(Array)

    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0][:id]).to be_a(String)

    expect(response[:data][0]).to have_key(:attributes)
    expect(response[:data][0][:attributes]).to be_an(Hash)

    expect(response[:data][0][:attributes]).to have_key(:price)
    expect(response[:data][0][:attributes][:price]).to be_an(Integer)
  end
end
