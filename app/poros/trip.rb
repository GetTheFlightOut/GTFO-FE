class Trip
  attr_reader :flight_id,
              :departure_datetime,
              :arrival_datetime,
              :r_departure_datetime,
              :r_arrival_datetime,
              :r_departure_date,
              :arrival_date,
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
              :description,
              :weekly_forecast

  def initialize(info)
    @flight_id = info[:attributes][:flight_id].to_i
    @departure_datetime = info[:attributes][:departure_datetime]
    @arrival_datetime = info[:attributes][:arrival_datetime]
    @arrival_date = date_convert(@arrival_datetime)
    @r_departure_datetime = info[:attributes][:r_departure_datetime]
    @r_arrival_datetime = info[:attributes][:r_arrival_datetime]
    @r_departure_date = date_convert(@r_departure_datetime)
    @origin_city = info[:attributes][:origin_city]
    @destination_city = info[:attributes][:destination_city]
    @price = info[:attributes][:price]
    @trip_duration = info[:attributes][:trip_duration]
    @max_f = info[:attributes][:max_f]
    @min_f = info[:attributes][:min_f]
    @max_c = info[:attributes][:max_c]
    @min_c = info[:attributes][:min_c]
    @day_feels_like_c = info[:attributes][:day_feels_like_c]
    @day_feels_like_f = info[:attributes][:day_feels_like_f]
    @booking_link = info[:attributes][:booking_link]
    @description = info[:attributes][:description]
    @weekly_forecast = WeatherFacade.get_weather(info[:attributes][:weather])
  end

  class << self
    def group_by_weather(trips)
      hot_trips = []
      warm_trips = []
      cool_trips = []
      cold_trips = []
      trips.each do |trip|
        hot_trips << trip if trip.day_feels_like_f >= 85
        warm_trips << trip if trip.day_feels_like_f >= 70 && trip.day_feels_like_f < 85
        cool_trips << trip if trip.day_feels_like_f >= 50 && trip.day_feels_like_f < 70
        cold_trips << trip if trip.day_feels_like_f <= 50
      end
      [hot_trips, warm_trips, cool_trips, cold_trips]
    end
  end

  def date_convert(date_time)
    converted_time = DateTime.strptime(date_time, '%F')
    converted_time.strftime('%F')
  end
end
