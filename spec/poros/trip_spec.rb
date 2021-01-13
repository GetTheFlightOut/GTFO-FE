require "rails_helper"
describe "Trip" do
    before :each do
      json_data = File.read('spec/fixtures/flights.json')
      @flight_info = JSON.parse(json_data, symbolize_names: true)

      @flight_json = @flight_info[:data][0]

      @test_flight = Trip.new(@flight_json)
    end

    it "exists and has attributes" do
      arrival_date = DateTime.strptime(@flight_json[:attributes][:arrival_datetime], '%F')
      formatted_arrival_date = arrival_date.strftime('%F')


      expect(@test_flight).to be_a(Trip)
      expect(@test_flight.flight_id).to eq(@flight_json[:attributes][:flight_id])
      expect(@test_flight.departure_datetime).to eq(@flight_json[:attributes][:departure_datetime])
      expect(@test_flight.description).to eq(@flight_json[:attributes][:description])

      arrival_date = DateTime.strptime(@flight_json[:attributes][:arrival_datetime], '%F')
      formatted_arrival_date = arrival_date.strftime('%F')

      expect(@test_flight.arrival_date).to eq(formatted_arrival_date)

      departure_date = DateTime.strptime(@flight_json[:attributes][:r_departure_datetime], '%F')
      formatted_departure_date = departure_date.strftime('%F')

      expect(@test_flight.r_departure_date).to eq(formatted_departure_date)
      expect(@test_flight.weekly_forecast.count).to eq(8)


      expected = @test_flight.weekly_forecast[0].sky_coverage
      actual = @flight_json[:attributes][:weather][0][:attributes][:sky_coverage]

      expect(expected).to eq(actual)
    end

    describe "class methods" do
      it "can sort trips by weather" do
        json = File.read('spec/fixtures/flights.json')
        #json = File.read('./spec/fixtures/flight_data_return.json')
        trips = JSON.parse(json, symbolize_names: true)[:data].map do |trip_info|
          Trip.new(trip_info)
        end
        require 'pry'; binding.pry
        expected = [q
                    [], 
                    [], 
                    [trips[2], trips[3], trips[4]], 
                    [trips[5], trips[6]]]
        expect(Trip.group_by_weather(trips)).to eq(expected)
      end
    end

    describe "instance methods" do
      it "can covert strptime to strftime format" do
        expect(@test_flight.date_convert(@flight_json[:attributes][:departure_datetime])).to eq("2021-01-30")
      end
    end
end
