require 'rails_helper'

describe 'when I click on a link to show a specific flight' do
  it 'takes me to a flight show page' do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=30/01/2021&trip_duration=3&limit=20"

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select "Denver International", from: "departure_airport"
    fill_in "departure_date", with: "2021-01-30"
    fill_in "trip_duration", with: 3
    click_button("Search Locations")

    expect(page).to have_link("Houston")

    click_link "Houston"

    expect(current_path).to eq(flight_show_path("242"))
    expect(page).to have_css(".Price")
    expect(page).to have_css(".TripOrigin")
    expect(page).to have_css(".TripDestination")
    expect(page).to have_css(".TripDepTime")
    expect(page).to have_css(".TripArrTime")
    expect(page).to have_css(".TripRDepTime")
    expect(page).to have_css(".TripRArrTime")
    expect(page).to have_css(".TripFeels")
    expect(page).to have_css(".TripWeatherDesc")
    expect(page).to have_css(".TripBooking")
    expect(".Price").to_not be_empty
    expect(".TripOrigin").to_not be_empty
    expect(".TripDestination").to_not be_empty
    expect(".TripDepTime").to_not be_empty
    expect(".TripArrTime").to_not be_empty
    expect(".TripRDepTime").to_not be_empty
    expect(".TripRArrTime").to_not be_empty
    expect(".TripFeels").to_not be_empty
    expect(".TripWeatherDesc").to_not be_empty
    expect(".TripBooking").to_not be_empty

    expect(page).to have_link("Click Here To Book")

    expect(page).to have_link("Home")
  end

  it "recieves an error if I navigate to an unknown flight id" do
    visit(flight_show_path(5631205))
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it "can see and visit accomodation links customized for destination city and travel dates" do
    json = File.read('./spec/fixtures/flight_data_return.json')
    query = "?departure_airport=DEN&departure_date=30/01/2021&trip_duration=3&limit=20"

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select "Denver International", from: "departure_airport"
    fill_in "departure_date", with: "2021-01-30"
    fill_in "trip_duration", with: 3
    click_button("Search Locations")

    expect(page).to have_link("Houston")

    click_link "Houston"

    expect(page).to have_css(".TripAirbnb")
    expect(page).to have_css(".TripHotels")
  end
end
