require 'rails_helper'

describe 'flight service' do
  it 'will return flight data' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=2021/01/30&trip_duration=3"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/flight_search#{query}").
            to_return(status: 200, body: json, headers: {})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select "Denver International", from: "departure_airport"
    fill_in "departure_date", with: "2021/01/30"
    fill_in "trip_duration", with: 3
    click_button("Search Locations")

    expect(page).to have_current_path('/flights')

    expect(page).to have_css('.flight', count: 4)

    within(first('.flight')) do
      expect(page).to have_css('.arrival-airport')
      expect(page).to have_css('.city')
      expect(page).to have_css('.carrier')
      expect(page).to have_css('.weather')
    end

    within(:xpath, '(//li[@class="flight"])[last()]') do
      expect(page).to have_css('.arrival-airport')
      expect(page).to have_css('.city')
      expect(page).to have_css('.carrier')
      expect(page).to have_css('.weather')
    end
  end
end
