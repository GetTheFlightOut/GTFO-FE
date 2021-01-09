class BackendService
  def self.conn
    Faraday.new(url: ENV["BACKEND_URL"])
  end

  def self.flights_search(query)
    response = conn.get('/flight_search') do |req|
      req.params[:fly_from] = query[:fly_from]
      req.params[:date_to] = query[:date_to]
      req.params[:date_from] = query[:date_from]
      req.params[:nights_in_dst_to] = query[:nights_in_dst_to]
      req.params[:nights_in_dst_from] = query[:nights_in_dst_from]
      req.params[:flight_type] = 'round'
      req.params[:one_for_city] = 1
      req.params[:partner_market] = 'us'
      req.params[:curr] = 'USD'
      req.params[:sort] = 'price'
      req.params[:ret_from_diff_airport] = 0
      req.params[:partner] = 'picky'
      req.params[:limit] = 20
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
