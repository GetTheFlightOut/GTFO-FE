require 'rails_helper'

describe 'when I click on a link to show a specific flight' do
  it 'takes me to a flight show page' do
    json1 = File.read('spec/fixtures/request_id_return.json')
    json2 = File.read('spec/fixtures/flights.json')
    json3 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&limit=20&trip_duration=3&uid'
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
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/604")
        .to_return(status: 200, body: json3, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Search Locations')

    expect(page).to have_link('Houston')

    click_link 'Houston'

    expect(current_path).to eq(flight_show_path('604'))
    expect(page).to have_css('.TripOrigin')
    expect(page).to have_css('.TripDestination')
    expect(page).to have_css('.TripDepTime')
    expect(page).to have_css('.TripArrTime')
    expect(page).to have_css('.TripRDepTime')
    expect(page).to have_css('.TripRArrTime')
    expect(page).to have_css('.TripBooking')
    expect('.Price').to_not be_empty
    expect('.TripOrigin').to_not be_empty
    expect('.TripDestination').to_not be_empty
    expect('.TripDepTime').to_not be_empty
    expect('.TripArrTime').to_not be_empty
    expect('.TripRDepTime').to_not be_empty
    expect('.TripRArrTime').to_not be_empty
    expect('.TripBooking').to_not be_empty

    expect(page).to have_link('Book Your Flight')

    within '.home-link' do
      expect(page).to have_link
    end
  end

  it 'invalid or expired flights show visits redirect to welcome index with a flash message' do
    json3 = File.read('spec/fixtures/flight_does_not_exist.json')

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/5631205")
        .to_return(status: 200, body: json3, headers: {})
    end

    visit flight_show_path(5631205)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Oops! Either that search expired, or you're trying to go somewhere you don't belong. Either way, try a new search to find your dream getaway.")
  end

  it 'can see and visit accomodation links customized for destination city and travel dates' do
    json1 = File.read('spec/fixtures/request_id_return.json')
    json2 = File.read('spec/fixtures/flights.json')
    json3 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&limit=20&trip_duration=3&uid'
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
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/604")
        .to_return(status: 200, body: json3, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Search Locations')

    expect(page).to have_link('Houston')

    click_link 'Houston'

    expect(page).to have_css('.TripAirbnb')
    expect(page).to have_css('.TripHotels')
  end

  it "shows a message to login with google if I'm not logged in" do
    json1 = File.read('spec/fixtures/trip_id_return.json')
    json2 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&limit=1&trip_duration=3&uid'
    json1_parsed = JSON.parse(json1, symbolize_names: true)

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json1, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/#{json1_parsed[:data][:trip_id]}")
        .to_return(status: 200, body: json2, headers: {})
    end

    visit '/'

    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Lucky Location')

    expect(page).to have_content("Please login with Google to book this flight!")
    expect(page).to have_link("login with Google")
  end

  it "shows a message to book the flight if I'm logged in" do
    json1 = File.read('spec/fixtures/trip_id_return.json')
    json2 = File.read('spec/fixtures/trip_return.json')
    query = '?departure_airport=DEN&departure_date=30/01/2021&limit=1&trip_duration=3&uid'
    json1_parsed = JSON.parse(json1, symbolize_names: true)

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/search#{query}")
        .to_return(status: 200, body: json1, headers: {})
    end

    if ENV['WEBMOCK'] == 'true'
      stub_request(:get, "#{ENV['BACKEND_URL']}/api/v1/trips/#{json1_parsed[:data][:trip_id]}")
        .to_return(status: 200, body: json2, headers: {})
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    select 'Denver International', from: 'departure_airport'
    fill_in 'departure_date', with: '2021-01-30'
    fill_in 'trip_duration', with: 3
    click_button('Lucky Location')

    expect(page).to have_link("Book Your Flight")
  end
end
