class TripFacade
  def self.get_trip(id)
    trip_data = BackendService.get_trip_data(id)
    if trip_data[:error]
      return
    else
      Trip.new(trip_data[:data])
    end
  end
end
