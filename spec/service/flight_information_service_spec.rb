require 'rails_helper'

describe 'flight service' do
  it 'will return flight data' do
    require './spec/fixtures/flight_data_return'
    stub_request(:get, "#{ENV["BACKEND_URL"]}/flight_search").
      with(header: {limit: 10}).to_return(body: return_data)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)

    visit '/'

    fill_in(:departure_airport).with("Denver International")
    fill_in(:trip_duration).with(3)
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
