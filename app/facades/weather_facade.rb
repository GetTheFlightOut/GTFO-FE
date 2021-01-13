class WeatherFacade
  def self.get_weather(weather_days)
    require 'pry'; binding.pry
    weather_days.map do |day|
      WeatherDay.new(day)
    end
  end
end