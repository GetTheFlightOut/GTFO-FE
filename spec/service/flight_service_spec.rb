describe 'Flights Service' do
  it 'can return flight search' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=30/01/2021&trip_duration=5"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/flight_search#{query}").
            to_return(status: 200, body: json, headers: {})


    query_params = {
              :departure_airport => 'DEN',
              :departure_date => '30/01/2021',
              :trip_duration => 5
              }

    response = BackendService.flights_search(query_params)
    expect(response).to be_an(Hash)
    expect(response[:data]).to be_a(Array)

    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0][:id]).to be_a(Integer)

    expect(response[:data][0]).to have_key(:departure_loc)
    expect(response[:data][0][:departure_loc]).to be_an(Hash)

    expect(response[:data][0]).to have_key(:price)
    expect(response[:data][0][:price]).to be_an(Integer)

  end
end
