require 'Date'

class SearchFacade
  def self.get_lucky(params)
    params[:limit] = 1
    flight_data = BackendService.trips_search(update_params(params))
    # require 'pry'; binding.pry
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
    flight_date = Date.new(*(params[:departure_date].split('-').map(&:to_i))).strftime("%m/%d/%Y")

    params[:departure_date] = flight_date

    params
  end
end
