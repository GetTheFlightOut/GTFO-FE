require 'rails_helper'

describe 'when I click on a link to show a specific flight' do
  it 'takes me to a flight show page' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=2021/01/30&trip_duration=3&limit=20"
    stub_request(:get, "#{ENV["BACKEND_URL"]}/api/v1/search#{query}").to_return(status: 200, body: json, headers: {})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select "Denver International", from: "departure_airport"
    fill_in "departure_date", with: "2021/01/30"
    fill_in "trip_duration", with: 3
    click_button("Search Locations")

    expect(page).to have_link("Houston")

    click_link "Houston"

    expect(current_path). to eq(flight_show_path("242"))
  end
end