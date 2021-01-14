class FlightsController < ApplicationController
  def show
    @trip = TripFacade.get_trip(params[:id])
    unless @trip
      redirect_to root_path, notice: standard_error
    end
  end

  def index
    @request_id = params[:id]
    @trips = RequestFacade.get_request(@request_id)

    @hot_trips, @warm_trips, @cool_trips, @cold_trips = Trip.group_by_weather(@trips)
  end

  def search
    if params[:commit] == 'Search Locations'

        @request_id = SearchFacade.get_request(flight_params)

      if @request_id == []
        redirect_to root_path, notice: 'There were no available trips that matched your search.'
      else
        return error_flash(@request_id) if @request_id.class == String
        redirect_to flights_requests_path(@request_id)
      end
    elsif params[:commit] == 'Lucky Location'

        @trip_id = SearchFacade.get_lucky(flight_params)

        if @trip_id == []
        redirect_to root_path, notice: 'There were no available trips that matched your search.'
      else
        return error_flash(@trip_id) if @trip_id.class == String

        params[:trip_id] = @trip_id
        redirect_to flight_show_path(@trip_id)
      end

    end
  end

  private
  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end

  def error_flash(error)
    flash[:error] = error.message
    redirect_to root_path
  end

  def write_to_cache(trips)
    trips.each do |trip|
      Rails.cache.write(trip.flight_id, trip)
    end
  end
end
