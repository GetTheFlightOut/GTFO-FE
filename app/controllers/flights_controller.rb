class FlightsController < ApplicationController
  def show
    @trip = Rails.cache.read(params[:id].to_i) or not_found
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
      end
    elsif params[:commit] == 'Lucky Location'
      @trip = SearchFacade.get_lucky(flight_params)
      if @trip.class == String
        flash[:error] = @trip
        redirect_to root_path
        return
      end
      Rails.cache.write(@trip.flight_id, @trip)
      redirect_to flight_show_path(@trip.flight_id)
    end
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end
end
