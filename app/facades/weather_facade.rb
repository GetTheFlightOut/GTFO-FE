class WeatherFacade
  def self.get_weather(weather_days)
    weather_days.map do |day|
      WeatherDay.new(day)
    end
  end
end