class SearchFacade

  def self.get_destination_city(params)
    flight_data = FlightService.get_city(params)
    flight_data.map do |data|
      Flight.new(data)
    end
  end
end
