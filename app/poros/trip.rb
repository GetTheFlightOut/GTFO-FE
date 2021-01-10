class Trip
  attr_reader :flight_id,
             :departure_datetime,
             :arrival_datetime,
             :r_departure_datetime,
             :r_arrival_datetime,
             :origin_city,
             :destination_city,
             :price,
             :trip_duration,
             :max_f,
             :min_f,
             :max_c,
             :min_c,
             :day_feels_like_c,
             :day_feels_like_f,
             :booking_link,
             :description

  def initialize(info)
    @flight_id = info[:attributes][:id].to_i
    @departure_datetime = info[:attributes][:departure_datetime]
    @arrival_datetime = info[:attributes][:arrival_datetime]
    @r_departure_datetime = info[:attributes][:r_departure_datetime]
    @r_arrival_datetime = info[:attributes][:r_arrival_datetime]
    @origin_city = info[:attributes][:origin_city]
    @destination_city = info[:attributes][:destination_city]
    @price = info[:attributes][:price]
    @trip_duration= info[:attributes][:trip_duration]
    @max_f = info[:attributes][:max_f]
    @min_f = info[:attributes][:min_f]
    @max_c = info[:attributes][:max_c]
    @min_c = info[:attributes][:min_c]
    @day_feels_like_c = info[:attributes][:day_feels_like_c]
    @day_feels_like_f = info[:attributes][:day_feels_like_f]
    @booking_link = info[:attributes][:booking_link]
    @description = info[:attributes][:description]
  end
end
