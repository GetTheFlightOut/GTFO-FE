class FlightsController < ApplicationController
  def show
    trip = Rails.cache.read(params[:id])
    if params[:trip]
      @trip = params[:trip]
    else
      @trip = SearchFacade.get_lucky(flight_params)
    end
  end

  def index
    @trips = SearchFacade.get_flights(flight_params)
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
