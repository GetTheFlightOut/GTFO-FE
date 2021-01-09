class Flight
  attr_reader :id,
              :departure_date,
              :return_date,
              :departure_city,
              :destination_city,
              :departure_airline,
              :return_airline,
              :price,
              :flight_duration

  def initialize(info)
    @id = info[:data][0][:id]
    @departure_date = info[:data][0][:attributes][:departure_date]
    @return_date = info[:data][0][:attributes][:return_date]
    @departure_city = info[:data][0][:attributes][:departure_loc][:city]
    @destination_city = info[:data][0][:attributes][:destination_loc][:city]
    @departure_airline = info[:data][0][:attributes][:airlines][:to]
    @return_airline = info[:data][0][:attributes][:airlines][:back]
    @price = info[:data][0][:attributes][:price]
    @flight_duration = info[:data][0][:attributes][:flight_duration]
  end
end
