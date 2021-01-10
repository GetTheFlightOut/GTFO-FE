class BackendService
  def self.conn
    Faraday.new(url: ENV['BACKEND_URL'])
  end

  def self.trips_search(query)
    response = conn.get('/api/v1/search') do |req|
      req.params[:departure_airport] = query[:departure_airport]
      req.params[:departure_date] = query[:departure_date]
      req.params[:trip_duration] = query[:trip_duration]
      req.params[:limit] = query[:limit]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
