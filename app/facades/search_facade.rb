class SearchFacade
  def self.get_lucky(params)
    params[:limit] = 1
    new_params = update_params(params)
    flight_data = BackendService.trips_search(new_params)
    return [] if flight_data[:data] == []
    Trip.new(flight_data[:data][0])
  end

  def self.get_flights(params)
    params[:limit] = 20
    flight_data = BackendService.trips_search(update_params(params))
    if flight_data[:data]
      flight_data[:data].map do |data|
        Trip.new(data)
      end
    elsif flight_data[:error]
      flight_data[:error]
    end
  end

  private

  def self.update_params(params)
    new_params = params
    new_params[:departure_date] = Date.new(*(params[:departure_date].split('-').map(&:to_i))).strftime('%d/%m/%Y')

    return new_params
  end
end
