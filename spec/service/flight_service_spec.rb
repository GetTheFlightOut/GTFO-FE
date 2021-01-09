describe 'Flights Service' do
  it 'can return flight search' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?curr=USD&date_from=30/01/2021&date_to=30/01/2021&flight_type=round&fly_from=DEN&limit=20&nights_in_dst_from=5&nights_in_dst_to=5&one_for_city=1&partner=picky&partner_market=us&ret_from_diff_airport=0&sort=price"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/flight_search#{query}").
            to_return(status: 200, body: json, headers: {})


    query_params = {
              :fly_from => 'DEN',
              :date_from => '30/01/2021',
              :date_to => '30/01/2021',
              :nights_in_dst_from => 5,
              :nights_in_dst_to => 5,
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
