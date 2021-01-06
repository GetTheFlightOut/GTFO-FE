require 'rails_helper'

describe 'welcome page' do
  describe 'As an unauthenticated user when I arrive at the website' do
    it 'I see a page with a city, date, and duration dropdown menu and lucky location button' do
      visit '/'

      expect(page).to have_field('departure-airport')

      expect(page).to have_field('departure-date')

      expect(page).to have_field('trip-duration')

      expect(page).to have_button('Lucky Location')

      expect(page).to have_link('Log In with Google')
    end
  end
end
