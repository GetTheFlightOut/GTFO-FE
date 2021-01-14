# GTFO-FE
![image](https://user-images.githubusercontent.com/68172332/104384272-6d70f100-54ee-11eb-94ba-287258e83de7.png)

## Table of Contents
  - [What it does](#what-it-does)
  - [How to Install GTFO-FE](#how-to-install-gtfo-fe)
  - [Dependencies](#dependencies)
  - [Testing](#testing)
  - [Learning Goals](#learning-goals)
  - [Licenses](#licenses)
  - [Contact](#contact)
  - [Acknowledgments](#acknowledgments)
  
  ![plane](https://user-images.githubusercontent.com/66448493/104544298-9e335200-55e4-11eb-9275-62d6a31ac828.gif)


## What it does

This project part of a Service-Oriented Architecture (SOA) application that provides users with flight and weather information based on search parameters that the user provides. The GTFO-FE serves as the user facing part of the application that a user can interact with. A user provides information through a form and is returned flight and weather information. The front end aplpication makes a call to the backend application, which in turn calls the Weather and Flight APIs and combines the data from both APIs into one JSON package to send to the front end.

To view the production site, please visit the [GTFO link](https://gtfo-fe.herokuapp.com/).

To view the other components of the application please visit the [Github Project Organization](https://github.com/GetThatFlightOut).

SOA System Design:
![Screen Shot 2021-01-14 at 8 47 13 AM](https://user-images.githubusercontent.com/68167430/104614507-8e982580-5645-11eb-930b-c380d62d13c4.png)

[Miro Board](https://miro.com/app/board/o9J_lZk4cS8=/) used for planning.

  ### API Endpoints pulled from backend

  Current API data pulled from the backend structure is:

  ```
{
    "data": [
        {
            "id": "0",
            "type": "trip",
            "attributes": {
                "origin_city": "Denver",
                "destination_city": "Las Vegas",
                "origin_iata": "DEN",
                "destination_iata": "LAS",
                "latitude": 36.08,
                "longitude": -115.15222,
                "price": 47,
                "departure_datetime": "2021-01-30T22:55:00.000+00:00",
                "arrival_datetime": "2021-01-30T23:58:00.000+00:00",
                "r_departure_datetime": "2021-02-04T06:30:00.000+00:00",
                "r_arrival_datetime": "2021-02-04T09:27:00.000+00:00",
                "booking_link": "https://www.kiwi.com/deep?from=DEN&to=LAS&flightsId=0713244648e100007b61b321_0%7C2446071348e60000bac08674_0&price=39&passengers=1&affilid=picky&lang=en&currency=USD&booking_token=BbkOXQKh-FnCWsmM58Mqtup98vx0wZPY5t5XrfnC5lbzioic-vVkE9feAF0vfzRF1HwNzrIWC7qG6KlS9Gupb05SlCWsm_nIxE9SYdS1god-08hkM-ISgFgM5X2nZC4NOszegqwPCwVVg8_apm0qlOwB17b8VCvM1BMGAEAZxsyoRNSCPLHpABvs2qeKQbbEXuYGFu-00ifs2vadBWVoyRZlBTIHhku2PJTtA7pIT5AjKO17NK6m9em3CrXSdV7oozuzVtu7MWtb8oyZdRmI-Xs5DI1YsV6Su6VKPWF-aZx6AS2P_60sNVDUDn3ZuskOmBZ1t1bqVXQYzSaDixyfFm3Ydq8JYRKduLp6Oxy8PUcovkqH4xedo-tkTyknLqbbstEJDBMGZL5vJf2m9kM2QET3Ca3xVqWY-M1mU8VNIMhmMFpZOyo0hSGIeVHBElUVP64FCPc1UdXEe36r0r-wgZeHMpTqXATnEtr3lwJzgbxbF4elDQ6IoUuHjrOyQUofqmCbwZ1hwWHgmy7KENlwhcsm3HhxpOnxWGS7JaIeU2k6YiQxB6Vh-DNalZV1zI8Yhj9OgM15qX-gclx8vBQKi12JExb-UV0tl7mMSaHqtoaqOpr3RBCkTOtWBz6r7CI-loOeBKV4lJYAvrdjBKvRNqAI_r-HrpIkujW4H76mjz1IWHoBH9zejN-KpAoCiJBdEr3PhM-oTfOZroJbMzTQ74g==",
                "trip_duration": 5,
                "flight_id": 775,
                "min_f": 35.57000000000005,
                "max_f": 49.110000000000014,
                "min_c": 3.57000000000005,
                "max_c": 17.110000000000014,
                "day_feels_like_f": 44.110000000000014,
                "day_feels_like_c": 12.110000000000014,
                "description": "clear sky",
                "weather_date": "2021-01-13T19:00:00+00:00",
                "sky_coverage": 10,
                "weather": [
                    {
                        "type": "weather",
                        "id": null,
                        "attributes": {
                            "min_f": 35.57000000000005,
                            "max_f": 49.110000000000014,
                            "min_c": 3.57000000000005,
                            "max_c": 17.110000000000014,
                            "day_feels_like_c": 12.110000000000014,
                            "day_feels_like_f": 44.110000000000014,
                            "description": "clear sky",
                            "date": "2021-01-13T19:00:00+00:00",
                            "sky_coverage": 10
                        }
                    },
                    ...(there will be 8 days worth of weather forecast here)
                ]
            }
        }
    ]
}
```
Results above are from the following call: http://gtfo-be.herokuapp.com/api/v1/search?departure_airport=DEN&departure_date=30/01/2021&trip_duration=5&limit=20

## How to Install GTFO-FE

GTFO-FE is hosted on [Heroku](https://gtfo-fe.herokuapp.com/), where you'll be able to view its functionality to the fullest.

For usage on your local machine follow the instructions listed below:

```
git clone git@github.com:GetThatFlightOut/GTFO-FE.git
cd GTFO-FE
bundle install
rake db:{create,migrate}
firgaro install
# Setup ENV Variables in application.yml: 
# BACKEND_URL: "http://localhost:3000" (or "https://gtfo-be.herokuapp.com to connect to BE server)
# GOOGLE_CLIENT_ID: YOUR-GOOGLE-CLIENT-ID
# GOOGLE_SECRET: YOUR-GOOGLE_SECRET_KEY
# WEBMOCK: 'true' (or false to test against backend connection server)
rails server
visit localhost:3000 in your web browser
```

## Dependencies
## Testing

Webmock is used for testing and can be toggled with the environment variable WEBMOCK, set as string 'true' or 'false'.

Adding tests with http mocks can be done by wrapping the stub in an if statement, 
```
if ENV['WEBMOCK'] == 'true'
  #code
end
```
#### Our testing addresses a number of sad paths including:

Lucky Location Search Returning No Results
![gtfo_luck_no_trips](https://user-images.githubusercontent.com/68172332/104547937-f53d2500-55ec-11eb-95a0-5cc8398cd3d1.gif)

Flights Show Path with Invalid/Expired ID
![gtfo_bad_path](https://user-images.githubusercontent.com/68172332/104548313-c70c1500-55ed-11eb-9822-3aa6b4995124.gif)

Search Locations Search Returning No Results
![gtfo_no_trips_standard](https://user-images.githubusercontent.com/68172332/104548226-99bf6700-55ed-11eb-8a68-dd9bac5b7e70.gif)

## Learning Goals

  * Consume external APIs

  * Build API's that return JSON responses

  * Refactor code for better code for improved organization/readability

  * Practice project management with project boards/daily standups/group retros

  * Utilize workflow: small commits, descriptive pull requests and code review

  * Write thorough and understandable documentation

## Licenses

  * Ruby 2.5.3
  * Sinatra

## Contact

#### Todd Estes: [LinkedIn](https://www.linkedin.com/in/toddwestes/), [Email](mailto:elestes@gmail.com), [GitHub](https://github.com/Todd-Estes)
 
#### Connor Ferguson: [LinkedIn](https://www.linkedin.com/in/connor-p-ferguson/), [Email](mailto:cpfergus1@gmail.com), [GitHub](https://github.com/cpfergus1)
 
#### George Soderholm: [LinkedIn](https://www.linkedin.com/in/george-soderholm-05776947/), [Email](mailto:georgesoderholm@gmail.com), [GitHub](https://github.com/GeorgieGirl24)
    
#### Sage Freeman-Gonzales: [LinkedIn](https://www.linkedin.com/in/sagefreemangonzales/), [Email](mailto:sagegonzales15@gmail.com), [GitHub](https://github.com/SageOfCode)
 
#### Sheryl Stillman: [LinkedIn](https://www.linkedin.com/in/sherylstillman1/), [Email](mailto:sheryl.stillman@gmail.com), [GitHub](https://github.com/stillsheryl)
    
#### Aidan Murray:  [LinkedIn](http://www.linkedin.com/in/aidan-murray-teknoserval), [Email](mailto:aidanhansm@gmail.com), [GitHub](https://github.com/TeknoServal)
      
#### Jesse Mellinger: [LinkedIn](https://www.linkedin.com/in/jesse-mellinger/), [Email](mailto:jesse.m.mellinger@gmail.com), [GitHub](https://github.com/JesseMellinger)
        
#### Nick King: [LinkedIn](https://www.linkedin.com/in/nick-king-3128501ba/), [Email](mailto:nickmaxking@gmail.com), [GitHub](https://github.com/nmking22)
 
#### Brian Liu: [LinkedIn](https://www.linkedin.com/in/brian-liu-8356287b/), [Email](mailto:brian.b.liu@gmail.com), [GitHub](https://github.com/badgerbreezy)
    
#### Will Dunlap: [LinkedIn](https://www.linkedin.com/in/willwdunlap/), [Email](mailto:dunlapww@gmail.com), [GitHub](https://github.com/dunlapww)
   
## Acknowledgments
