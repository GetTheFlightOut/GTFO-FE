class Flight
  attr_reader :id,
              :departure_date,
              :return_date,
              :departure_city,
              :destination_city,
              :departure_airline,
              :return_airline,
              :price,
              :flight_duration,
              :average_temp,
              :qualitative_forecast

  def initialize(info)
    require "pry"; binding.pry
    @id = info[:id]
    @departure_date = info[:datetime_departure]
    @return_date = info[:datetime_arrival]
    @departure_city = info[:departure_loc][:city]
    @destination_city = info[:arrival_loc][:city]
    @departure_airline = info[:airlines][:to]
    @return_airline = info[:airlines][:back]
    @price = info[:price]
    @flight_duration = info[:duration]
    @average_temp = info[:average_forcast][:average_temp]
    @qualitative_forecast = info[:average_forcast][:qualitative_forecast]
  end
end
