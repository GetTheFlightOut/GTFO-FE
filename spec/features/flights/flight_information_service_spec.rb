require 'rails_helper'

describe 'flight service' do
  it 'will return flight data' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=2021/01/30&trip_duration=3&limit=20"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/api/v1/search#{query}").
            to_return(status: 200, body: json, headers: {})

    query_params = {
              :departure_airport => 'DEN',
              :departure_date => '30/01/2021',
              :trip_duration => 3
              }

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select "Denver International", from: "departure_airport"
    fill_in "departure_date", with: "2021/01/30"
    fill_in "trip_duration", with: 3
    click_button("Search Locations")
    expect(page).to have_current_path(flights_path, ignore_query: true)

    expect(page).to have_css('.Flight', count: 5)

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
end
