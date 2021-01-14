class RequestFacade
  def self.get_request(id)
    request_data = BackendService.get_request_data(id)
    request_data[:included].map do |trip|
      Trip.new(trip)
    end
  end
end
