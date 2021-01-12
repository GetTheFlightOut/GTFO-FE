require 'rails_helper'

RSpec.describe 'Lucky Request' do
  describe 'As a User or Visitor' do
    it 'can visit the welcome page and get a lucky location' do
      stub_request(:get, "https://gtfo-be.herokuapp.com/?departure_airport=DEN&departure_date=2021-01-06&trip_duration=5").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.3.0'
          }).
        to_return(status: 200, body: "", headers: {})
      json_response = File.read('spec/fixtures/current_lucky_call.json')
      binding.pry
      visit '/'
      # when I visit the welcome page,
      # select 'Departure Airport:', :with => "Denver International"
      select 'Denver International', :from => "Departure Airport:"
      fill_in :departure_date, with: '2021-01-06'
      fill_in :trip_duration, with: 5
      click_on 'Lucky Location'

      expect(current_path).to eq('/flight/show')
      # select('Option', :from => 'Select Box')
      # when I fill out the departure location, date, duration, and hit 'Lucky Location',
      expect(page).to have_content('Departure Airport: Denver International')
      expect(page).to have_content('Departure Date: 2021-01-06')
      expect(page).to have_content('Trip Duration: 5')
      expect(page).to have_content('Destination City: Paris')
      # a request is made to the backend repo for data with those flight parameters.
    end
  end
end
