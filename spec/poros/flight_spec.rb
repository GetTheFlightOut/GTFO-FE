require "rails_helper"

describe "Flight" do
  it "exists and has attributes" do
    info =
    {
      data:
      [

          id: 1,
          type: "Lucky!",
          attributes:
            {
              departure_date: "2021-01-06",
              return_date: "2021-01-12",
              trip_duration: 5,
              departure_loc:
                {
                  city: "Denver",
                  airport: "DEN",
                },
              destination_loc:
                {
                  city: "Paris",
                  airport: "CDG"
                },
              airlines:
                {
                  to: "delta",
                  back: "delta"
                },
              price: 800.00,
              seat_availability: 5,
              fly_duration: "8h 30m",
              current_forecast:
                {
                  is_available: true,
                  temp: 85.7,
                  feels_like: 91.4,
                  chance_precip: 20,
                  qualitative_forecast: "mist"
                }
            }
          ]
    }
    #TRIED TO UTILIZE CURRENT_LUCKY_CALL FIXTURE FILE - UNSUCCESSFUL
    #THE ABOVE HASH DATA STRUCTURE IS EXACT COPY OF FIXTURE AND WILL PASS TEST

    # json_response = File.read('spec/fixtures/current_lucky_call.json')
    # flight = Flight.new(json_response)
    flight = Flight.new(info)
    expect(flight).to be_a Flight
    expect(flight.id).to eq(info[:data][0][:id])
    expect(flight.departure_date).to eq(info[:data][0][:attributes][:departure_date])
    expect(flight.return_date).to eq(info[:data][0][:attributes][:return_date])
    expect(flight.departure_city).to eq(info[:data][0][:attributes][:departure_loc][:city])
    expect(flight.destination_city).to eq(info[:data][0][:attributes][:destination_loc][:city])
    expect(flight.departure_airline).to eq(info[:data][0][:attributes][:airlines][:to])
    expect(flight.return_airline).to eq(info[:data][0][:attributes][:airlines][:back])
    expect(flight.price).to eq(info[:data][0][:attributes][:price])
    expect(flight.flight_duration).to eq(info[:data][0][:attributes][:flight_duration])
  end
end
