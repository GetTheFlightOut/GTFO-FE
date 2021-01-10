class FlightsController < ApplicationController
  def show
    #DREAM DRIVING HERE, CREATED FLIGHT PORO,
    #CREATED SKELETON FOR SearchFacade
    response = Faraday.get(ENV["BACKEND_URL"]) do |f|
      f.params[:departure_airport] = flight_params[:departure_airport]
      f.params[:departure_date] = flight_params[:departure_date]
      f.params[:trip_duration] = flight_params[:trip_duration]
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def index
    # require "pry"; binding.pry
    @trips = SearchFacade.get_flights(flight_params)


    # response = Faraday.get(ENV["BACKEND_URL"]) do |f|
    #   f.params[:departure_airport] = flight_params[:departure_airport]
    #   f.params[:departure_date] = flight_params[:departure_date]
    #   f.params[:trip_duration] = flight_params[:trip_duration]
    # end
    # json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
