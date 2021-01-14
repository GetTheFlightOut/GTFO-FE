class TripFacade
  def self.get_trip(id)
    trip_data = BackendService.get_trip_data(id)
    Trip.new(trip_data[:data])
  end
end
