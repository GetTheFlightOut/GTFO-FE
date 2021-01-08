class FlightController < ApplicationController
  def show
    response = Faraday.get("https://gtfo-be.herokuapp.com/") do |f|
      f.params[:departure_airport] = lucky_params[:departure_airport]
      f.params[:departure_date] = lucky_params[:departure_date]
      f.params[:trip_duration] = lucky_params[:trip_duration]
    end
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  private
  def lucky_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
