class SearchFacade
  def self.get_lucky(params)
    params[:limit] = 1
    flight_data = BackendService.trips_search(update_params(params))

    if flight_data[:data]
      flight_data[:data][:trip_id].to_i

    elsif flight_data[:error]
      flight_data[:error]
    end
  end

  def self.get_flights(params)
    params[:limit] = 20
    flight_data = BackendService.trips_search(update_params(params))

    if flight_data[:data]
      flight_data[:data][:request_id].to_i

    elsif flight_data[:error]
      flight_data[:error]
    end
  end

  def self.get_request(params)
    params[:limit] = 20
    flight_data = BackendService.trips_search(update_params(params))
    if flight_data[:data]
      flight_data[:data][:request_id]

    elsif flight_data[:error]
      flight_data[:error]
    end
  end

  def self.update_params(params)
    new_params = params
    new_params[:departure_date] = Date.new(*params[:departure_date].split('-').map(&:to_i)).strftime('%d/%m/%Y')

    new_params
  end
end
