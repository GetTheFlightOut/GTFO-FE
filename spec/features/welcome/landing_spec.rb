require 'rails_helper'

describe 'welcome page' do
  describe 'As an unauthenticated user when I arrive at the website' do
    it 'I see a page with a city, date, and duration dropdown menu and lucky location button' do
      visit '/'

      expect(page).to have_field('departure_airport')

      expect(page).to have_field('departure_date')

      expect(page).to have_field('trip_duration')

      expect(page).to have_button('Lucky Location')

      within('.navbar-header') do
        expect(page).to have_link('Log In with Google')
      end

      within('.login-link') do
        expect(page).to have_link('Log In with Google')
      end

      expect(page).to_not have_link('Logout')
    end
  end

  scenario 'user logs in using Google OAuth' do
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

                                                                })

    stub_omniauth
    visit root_path
    expect(page).to_not have_button('Search Locations')
    expect(page).to have_link('Log In with Google')
    within('.login-link') do
      click_link 'Log In with Google'
    end
    expect(page).to have_button('Search Locations')

    expect(page).to have_link('Logout')

    click_link('Logout')

    expect(current_path).to eq(root_path)

    within('.navbar-header') do
      expect(page).to have_link('Log In with Google')
    end

    within('.login-link') do
      expect(page).to have_link('Log In with Google')
    end
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                         provider: 'google_oauth2',
                                                                         uid: '12345678910',
                                                                         info: { 'name' => 'William Dunlap',
                                                                                 'email' => 'dunlapww@gmail.com',
                                                                                 'unverified_email' => 'dunlapww@gmail.com',
                                                                                 'email_verified' => true,
                                                                                 'first_name' => 'William',
                                                                                 'last_name' => 'Dunlap',
                                                                                 'image' => 'https://lh3.googleusercontent.com/a-/AOh14GjhAh3U9dMZzp_IOL6z6pQZqIOSD2kPAtAPVLvrqg=s96-c' },
                                                                         credentials: {
                                                                           token: 'abcdefg12345',
                                                                           expires_at: DateTime.now,
                                                                           expires: true
                                                                         }

                                                                       })
  end


end
