require 'rails_helper'
describe 'Trip' do
  before :each do
    @weekly_weather_data = {
      type: 'weather',
      id: nil,
      attributes: {
        min_f: 33.08000000000004,
        max_f: 45.210000000000036,
        min_c: 1.080000000000041,
        max_c: 13.210000000000036,
        day_feels_like_c: 8.54000000000002,
        day_feels_like_f: 40.54000000000002,
        description: 'clear sky',
        date: '2021-01-12T19:00:00+00:00',
        sky_coverage: 0
      }
    }
    @weather_day = WeatherDay.new(@weekly_weather_data)
  end

  it 'exists and has attributes' do
    expect(@weather_day).to be_a(WeatherDay)
    expect(@weather_day.min_f).to eq(@weekly_weather_data[:attributes][:min_f])
    expect(@weather_day.max_f).to eq(@weekly_weather_data[:attributes][:max_f])
    expect(@weather_day.min_c).to eq(@weekly_weather_data[:attributes][:min_c])
    expect(@weather_day.max_c).to eq(@weekly_weather_data[:attributes][:max_c])
    expect(@weather_day.day_feels_like_c).to eq(@weekly_weather_data[:attributes][:day_feels_like_c])
    expect(@weather_day.day_feels_like_f).to eq(@weekly_weather_data[:attributes][:day_feels_like_f])
    expect(@weather_day.description).to eq(@weekly_weather_data[:attributes][:description])
    expect(@weather_day.date).to eq('2021-01-12')
    expect(@weather_day.sky_coverage).to eq(@weekly_weather_data[:attributes][:sky_coverage])
    expect(@weather_day.image_path).to eq('weather_images/sunny.jpg')
  end
end
