class FlightController < ApplicationController
  def show
    #DREAM DRIVING HERE, CREATED FLIGHT PORO,
    #CREATED SKELETON FOR SearchFacade
    response = Faraday.get(ENV["DEVELOPMENT_HOST"]) do |f|
      f.params[:departure_airport] = lucky_params[:departure_airport]
      f.params[:departure_date] = lucky_params[:departure_date]
      f.params[:trip_duration] = lucky_params[:trip_duration]
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def lucky_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
