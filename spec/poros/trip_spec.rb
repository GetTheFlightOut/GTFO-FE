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

    describe "instance methods" do
      it "can covert strptime to strftime format" do
        expect(@test_flight.date_convert(@flight_json[:attributes][:departure_datetime])).to eq("2021-01-14")
      end
    end
end
