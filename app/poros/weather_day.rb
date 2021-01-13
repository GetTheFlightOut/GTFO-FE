class WeatherDay
  attr_reader :min_f,
              :max_f,
              :min_c,
              :max_c,
              :day_feels_like_c,
              :day_feels_like_f,
              :description,
              :date,
              :sky_coverage,
              :image_path

  def initialize(day)
    @min_f = day[:attributes][:min_f]
    @max_f = day[:attributes][:max_f]
    @min_c = day[:attributes][:min_c]
    @max_c = day[:attributes][:max_c]
    @day_feels_like_c = day[:attributes][:day_feels_like_c]
    @day_feels_like_f = day[:attributes][:day_feels_like_f]
    @description = day[:attributes][:description]
    @date = date_convert(day[:attributes][:date])
    @sky_coverage = day[:attributes][:sky_coverage]
    @image_path = get_weather_img(@description)
  end

  private

  def get_weather_img(weather_desc)
    partly_sunny_weather = ['partly sunny', 'partly cloudy', 'scattered clouds',
                            'broken clouds'].include?(weather_desc)
    thunder_storms_weather = ['thunderstorm with rain', 'thunderstorm with heavy rain', 'light thunderstorm',
                              'thunderstorm', 'heavy thunderstorm', 'ragged thunderstorm', 'thunderstorm with light drizzle', 'thunderstorm with drizzle', 'thunderstorm with heavy drizzle'].include?(weather_desc)
    sunny_weather = ['clear sky'].include?(weather_desc)
    rainy_weather = ['light intensity drizzle', 'drizzle', 'heavy intensity drizzle', 'light intensity drizzle rain',
                     'drizzle rain', 'heavy intensity drizzle rain', 'shower rain and drizzle', 'heavy shower rain and drizzle', 'shower drizzle', 'light rain', 'moderate rain', 'heavy intensity rain', 'very heavy rain', 'extreme rain', 'freezing rain', 'light intensity shower rain', 'shower rain', 'heavy intensity shower rain', 'ragged shower rain'].include?(weather_desc)
    snowy_weather = ['light snow', 'Snow', 'Heavy snow', 'Sleet', 'Light shower sleet', 'Shower sleet',
                     'Light rain and snow', 'Rain and snow', 'Light shower snow', 'Shower snow', 'Heavy shower snow'].include?(weather_desc)
    cloudy_weather = ['few clouds', 'scattered clouds', 'broken clouds', 'overcast clouds'].include?(weather_desc)
    case true
    when sunny_weather
      'sun.jpg'
    when rainy_weather
      'rain.jpg'
    when cloudy_weather
      'cloudy.jpg'
    when snowy_weather
      'snow.jpg'
    when partly_sunny_weather
      'partly_clouds.jpg'
    when thunder_storms_weather
      'thunder.jpg'
    else
      'partly_clouds.jpg'
    end
  end

  def date_convert(date_time)
    converted_time = DateTime.strptime(date_time, '%F')
    converted_time.strftime('%F')
  end
end
