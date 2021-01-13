require 'rails_helper'

describe 'flight service' do
  it 'will return trip results for search locations' do
    json = File.read('spec/fixtures/flights.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&trip_duration=3&limit=20'

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Search Locations')
    expect(page).to have_current_path(flights_path, ignore_query: true)

    expect(page).to have_css('.Flight', count: 20)

    within(first('.Flight')) do
      expect(page).to have_css('.DestinationCity')
      expect(page).to have_css('.Price')
      expect(page).to have_css('.Duration')
      expect(page).to have_css('.Weather')
    end

    within(:xpath, '(//tr[@class="Flight"])[last()]') do
      expect(page).to have_css('.DestinationCity')
      expect(page).to have_css('.Price')
      expect(page).to have_css('.Duration')
      expect(page).to have_css('.Weather')
    end
  end

  it 'will return a trip results for lucky locations' do
    json_data = File.read('spec/fixtures/flights.json')
    @flights_data = JSON.parse(json_data, symbolize_names: true)
    flight_json = {data: [@flights_data[:data][0]]}.to_json
    
    query = '?departure_airport=DEN&departure_date=30/01/2021&trip_duration=3&limit=1'
    
    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
      .to_return(status: 200, body: flight_json, headers: {})
    end
    
    visit '/'
    
    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Lucky Location')
    
    expect(current_path).to eq(flight_show_path('939'))
    
    expect(page).to have_content('Las Vegas')
  end
  
  it 'returns error when too far out date given' do
    json = File.read('./spec/fixtures/flight_data_bad_date.json')
    query = '?departure_airport=DEN&departure_date=30/01/2028&limit=20&trip_duration=3'

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json, headers: {})
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    fill_in 'departure_date', with: '2028-01-30'
    fill_in 'trip_duration', with: 3

    click_button('Search Locations')

    expect(page).to have_current_path(root_path)

    expect(page).to have_css('.error')

    within '.error' do
      expect(page).to have_content('Departure date too far in the future')
    end
  end

  it 'returns error when no flights returned' do
    json = File.read('./spec/fixtures/flight_data_no_flights.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&limit=20&trip_duration=3'
    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3

    click_button('Search Locations')

    expect(page).to have_current_path(root_path)

    expect(page).to have_css('.error')

    within '.error' do
      expect(page).to have_content('No flights match criteria')
    end
  end
end
