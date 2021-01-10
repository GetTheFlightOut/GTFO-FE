class FlightsController < ApplicationController
  def show
    @trip = Rails.cache.read(params[:id]) or not_found
  end

  def index
    if params[:commit] == 'Search Locations'
      @trips = SearchFacade.get_flights(flight_params)
      @trips.each do |trip|
        Rails.cache.write(trip.flight_id, trip)
    elsif params[:commit] == 'Lucky Location'
      # code
    end
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
