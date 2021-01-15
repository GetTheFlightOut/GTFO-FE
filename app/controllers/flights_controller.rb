class FlightsController < ApplicationController
  def show
    @trip = TripFacade.get_trip(params[:id])
    redirect_to root_path, notice: standard_error unless @trip
  end

  def index
    @request_id = params[:id]
    @trips = RequestFacade.get_request(@request_id)

    @hot_trips, @warm_trips, @cool_trips, @cold_trips = Trip.group_by_weather(@trips)
  end

  def search
    if params[:commit] == 'Search Locations'
      @request_id = SearchFacade.get_request(flight_params)

      return error_flash(@request_id) if @request_id.instance_of?(String)

      redirect_to flights_requests_path(@request_id)

    elsif params[:commit] == 'Lucky Location'

      @trip_id = SearchFacade.get_lucky(flight_params)

      return error_flash(@trip_id) if @trip_id.instance_of?(String)

      params[:trip_id] = @trip_id
      redirect_to flight_show_path(@trip_id)

    end
  end

  private

  def flight_params
    params.permit(:departure_airport, :departure_date, :trip_duration)
  end

  def error_flash(error)
    flash[:error] = error
    redirect_to root_path
  end

end
