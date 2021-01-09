require 'rails_helper'

RSpec.describe 'Lucky Request' do
  describe 'As a User or Visitor' do
    it 'can visit the welcome page and get a lucky location' do
      #BELOW IS ATTEMPT TO MOCK CURRENT_LUCKY_CALL FIXTURE FILE - UNSUCCESSFUL
      #FIXTURE FILE RENDERED JSON::ParserError: 765: unexpected token ERROR
      json_response = File.read('spec/fixtures/current_lucky_call.json')
      stub_request(:get, "http://localhost:3000/?departure_airport=DEN&departure_date=2021-01-06&trip_duration=5").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.3.0'
         }).
       to_return(status: 200, body: json_response.to_json, headers: {})

      visit '/'

      select 'Denver International', :from => "Departure Airport:"
      fill_in :departure_date, with: '2021-01-06'
      fill_in :trip_duration, with: 5
      click_on 'Lucky Location'

      expect(current_path).to eq('/flight/show')

      expect(page).to have_content('Departure Airport: Denver International')
      expect(page).to have_content('Departure Date: 2021-01-06')
      expect(page).to have_content('Trip Duration: 5')
      expect(page).to have_content('Destination City: Paris')
    end
  end
end
