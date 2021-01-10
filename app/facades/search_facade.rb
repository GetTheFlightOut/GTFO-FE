class SearchFacade

  def self.get_lucky(params)
    params[:limit] = 1
    flight_data = BackendService.trips_search(params)
    Trip.new(flight_data[:data][0])
  end


  def self.get_flights(params)
    params[:limit] = 20
    flight_data = BackendService.trips_search(params)
    flight_data[:data].map do |data|
      Trip.new(data)
    end
  end
end
