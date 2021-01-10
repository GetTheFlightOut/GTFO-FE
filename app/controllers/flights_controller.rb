class FlightsController < ApplicationController
  def show
    @trip = Rails.cache.read(params[:id]) or not_found
  end

  def index
    if params[:commit] == 'Search Locations'
      @trips = SearchFacade.get_flights(flight_params)
      if @trips.class == String
        flash[:error] = @trips
        redirect_to root_path
        return
      end
      @trips.each do |trip|
        Rails.cache.write(trip.flight_id, trip)
    elsif params[:commit] == 'Lucky Location'
      if @trips.class == String
        flash[:error] = @trips
        redirect_to root_path
        return
      end
      # code
    end
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
