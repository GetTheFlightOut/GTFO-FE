class FlightsController < ApplicationController
  def show
    @trip = Rails.cache.read(params[:id].to_i) or not_found
  end

  def index
    if params[:commit] == 'Search Locations'
      @trips = SearchFacade.get_flights(flight_params)
      return error_flash(@trips) if @trips.class == String
      write_to_cache(@trips)
    elsif params[:commit] == 'Lucky Location'
      @trip = SearchFacade.get_lucky(flight_params)
      return error_flash(@trip) if @trip.class == String
      write_to_cache([@trip])
      redirect_to flight_show_path(@trip.flight_id)
    end
  end
  test

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end

  def error_flash(error)
    flash[:error] = error
    redirect_to root_path
  end

  def write_to_cache(trips)
    trips.each do |trip|
      Rails.cache.write(trip.flight_id, trip)
    end
  end
end
