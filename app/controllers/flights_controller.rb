class FlightsController < ApplicationController
  def show
    @trip = TripFacade.get_trip(params[:id])
  end

  def index
    @request_id = params[:id]
    @trips = RequestFacade.get_request(@request_id)

    @hot_trips, @warm_trips, @cool_trips, @cold_trips = Trip.group_by_weather(@trips)
  end

  def search
    if params[:commit] == 'Search Locations'
      begin
        @request_id = SearchFacade.get_request(flight_params)
      rescue StandardError => error

        return error_flash(error)
      end

      redirect_to flights_requests_path(@request_id)
    elsif params[:commit] == 'Lucky Location'
      begin
        @trip_id = SearchFacade.get_lucky(flight_params)
      rescue StandardError => error
        return error_flash(error)

      end
      params[:trip_id] = @trip_id
      redirect_to flight_show_path(@trip_id)
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
