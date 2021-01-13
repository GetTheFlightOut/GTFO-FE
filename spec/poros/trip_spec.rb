require "rails_helper"
describe "Trip" do
    before :each do
      @info = {
              "id":0,
              "type":"trip",
              "attributes":
                {
                  "origin_city":"Denver",
                  "destination_city":"Houston",
                  "origin_iata":"DEN",
                  "destination_iata":"IAH",
                  "latitude":29.9844444,
                  "longitude":-95.341389,
                  "price":49,
                  "departure_datetime":"2021-01-30T10:07:00.000+00:00",
                  "arrival_datetime":"2021-01-30T13:32:00.000+00:00",
                  "r_departure_datetime":"2021-02-04T14:41:00.000+00:00",
                  "r_arrival_datetime":"2021-02-04T16:19:00.000+00:00",
                  "booking_link":
                  "https://www.kiwi.com/deep?from=DEN&to=IAH&flightsId=0713230e48e1000055702f9c_0%7C230e071348e6000063003075_0&price=40&passengers=1&affilid=picky&lang=en&currency=USD&booking_token=BH6d3ZbUWgOg05ck0nutzMR4nWvyYNTeEM_aYAd77NEcM60o7L5uTwn1n3qwVJJSXxQHxqIz78x2u1OxJ0GUu4sfBcHo8HjNSsF9H4Vai0ikkuKhcANGpQhfH-JUuXVibvGRT3DpV1MlmLQ7KSomq_gzNK3squKcjEoMh4xoG8zcpYlPFgVXRHEpBB1U-elSTs0tq9IPMmqPLTPuYP-PZfQxUcwyO3SSWEr1P5N1P24UpGqcyTLSc_RfzwnIj0xe4JAYifMo9eqtftdHuMQleLmgL6JNAYNcRJGeEitGpj8ScrCV-dHmybWwNdJcZOL_HtS8sY8aKH9SC9Rm0spEZ63VLPX_dGZ40s6BPR-Xc294MijvJi5f9l8IspbxGQqx6hpcYXcXrJeP1Hkva3Ckj6cXdNsUE0lbG-cDFbsMT_us9GBRpeuBx3MFYmZiGaD8BDj7QvuInX9KLexxdjgul-DTbx3AruY0U1cx3_X-CiQuBDUHAJXcJyY7d9PuRnoKCH15-YuwJaMGx7ykEKHy84iieVT_S9Uv-4R8ElVEUAXfnrFch1CANNx3D02B0oQRp-N3g-09jEQGmLvKd-d1Zcia3M3mpVz1VDdyfyy7_X8AkSx5x02LK0MiESKqV2_EFWGobFuw0GrYScsvJ_XuLgrmeWVhQszHfDKuYNPXo71U=",
                  "trip_duration":5,
                  "flight_id":242,
                  "min_f":30.400000000000034,
                  "max_f":34.99000000000001,
                  "min_c":-1.599999999999966,
                  "max_c":2.990000000000009,
                  "day_feels_like_c":-7.0499999999999545,
                  "day_feels_like_f":24.950000000000045,
                  "description":"clear sky",
                  "date":"2021-01-09T02:00:00+00:00"
                }
              }
      @trip = Trip.new(@info)
    end
    it "exists and has attributes" do
      expect(@trip).to be_a(Trip)
      expect(@trip.flight_id).to eq(242)
      expect(@trip.departure_datetime).to eq("2021-01-30T10:07:00.000+00:00")
      expect(@trip.description).to eq("clear sky")
      expect(@trip.arrival_date).to eq("2021-01-30")
      expect(@trip.r_departure_date).to eq("2021-02-04")
    end

    describe "class methods" do
      it "can sort trips by weather" do
        json = File.read('./spec/fixtures/flight_data_return.json')
        trips = JSON.parse(json, symbolize_names: true)[:data].map do |trip_info|
          Trip.new(trip_info)
        end

        expected = [[trips[1]], [trips[15]], [trips[3], trips[8]], [trips[0], trips[2], trips[4], trips[5], trips[6], trips[7], trips[9], trips[10], trips[11], trips[12], trips[13], trips[14], trips[16], trips[17], trips[18], trips[19]]]
        expect(Trip.group_by_weather(trips)).to eq(expected)
      end
    end

    describe "instance methods" do
      it "can covert strptime to strftime format" do
        expect(@trip.date_convert(@info[:attributes][:departure_datetime])).to eq('2021-01-30')
      end
    end
end
