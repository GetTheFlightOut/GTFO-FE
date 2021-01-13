require 'rails_helper'

describe WeatherFacade, type: :facade do
  before :each do
    json_data = File.read('spec/fixtures/flights.json')
    flight_info = JSON.parse(json_data, symbolize_names: true)
    @weekly_weather_data = flight_info[:data][0][:attributes][:weather]
  end

  it 'returns an array of weather objects' do
    expect(WeatherFacade.get_weather(@weekly_weather_data)).to be_a Array
    expect(WeatherFacade.get_weather(@weekly_weather_data)[0]).to be_a WeatherDay
    expect(WeatherFacade.get_weather(@weekly_weather_data).count).to eq(8)
  end
end