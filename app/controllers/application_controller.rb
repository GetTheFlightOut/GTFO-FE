class ApplicationController < ActionController::Base
  helper_method :current_user, :not_found, :select_weather_image

  def current_user
    @current_user ||= User.find_by(uid: session[:uid]) if session[:uid]
  end

  def select_weather_image(weather_desc)
    partly_sunny_weather = ["partly sunny" , "partly cloudy" , "scattered clouds" , 'broken clouds'].include?(weather_desc)
    thunder_storms_weather = ["thunderstorm with rain", "thunderstorm with heavy rain", "light thunderstorm", "thunderstorm", "heavy thunderstorm", "ragged thunderstorm", "thunderstorm with light drizzle", "thunderstorm with drizzle", "thunderstorm with heavy drizzle"].include?(weather_desc)
    sunny_weather = ["clear sky"].include?(weather_desc)
    rainy_weather = ["light intensity drizzle", "drizzle", "heavy intensity drizzle", "light intensity drizzle rain", "drizzle rain", "heavy intensity drizzle rain", "shower rain and drizzle", "heavy shower rain and drizzle", "shower drizzle", "light rain", "moderate rain", "heavy intensity rain", "very heavy rain", "extreme rain", "freezing rain", "light intensity shower rain", "shower rain", "heavy intensity shower rain", "ragged shower rain"].include?(weather_desc)
    snowy_weather = ["light snow", "Snow", "Heavy snow", "Sleet", "Light shower sleet", "Shower sleet", "Light rain and snow", "Rain and snow", "Light shower snow", "Shower snow", "Heavy shower snow"].include?(weather_desc)
    cloudy_weather = ["few clouds", "scattered clouds", "broken clouds", "overcast clouds"].include?(weather_desc)
    test = case true
      when sunny_weather
        "weather_images/sunny.jpg"
      when rainy_weather
        "weather_images/rainy.jpg"
      when cloudy_weather
        "weather_images/cloudy.jpg"
      when snowy_weather
        "weather_images/snow.jpg"
      when partly_sunny_weather
        "weather_images/partly_sunny.jpg"
      when thunder_storms_weather
        "weather_images/thunder_storms.jpg"
      else
        "weather_images/partly_sunny.jpg"
    end
  end

  def not_found
    render :file => './public/404.html', :status => 404
  end
end
