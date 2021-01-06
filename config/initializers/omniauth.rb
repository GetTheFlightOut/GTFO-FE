Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'] #, redirect_uri: "https://localhost:3000/auth/google/callback"
end
