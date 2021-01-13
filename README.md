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

## What it does

This project part of a Service-Oriented Architecture (SOA) application. The GTFO-BE serves as pass through of API data from our microservice repos (Weather API and Flight API) to the GTFO-FE repo.

SOA System Design:
![GTFO SOA](https://user-images.githubusercontent.com/7945439/104348765-5b2b8e80-54bf-11eb-9505-931e5767533a.png)

  ### API Endpoints pulled from backend

  Current API data pulled from the backend structure is:

  ```
{
  "data": [
    {
      "id": "242",
      "type": "trip",
      "attributes": {
        "origin_city": "Denver",
        "destination_city": "Houston",
        "origin_iata": "DEN",
        "destination_iata": "IAH",
        "latitude": 29.9844444,
        "longitude": -95.341389,
        "price": 49,
        "departure_datetime": "2021-01-30T10:07:00.000+00:00",
        "arrival_datetime": "2021-01-30T13:32:00.000+00:00",
        "r_departure_datetime": "2021-02-04T14:41:00.000+00:00",
        "r_arrival_datetime": "2021-02-04T16:19:00.000+00:00",
        "booking_link": "https://www.kiwi.com/deep?from=DEN&to=IAH&flightsId=0713230e48e1000055702f9c_0%7C230e071348e6000063003075_0&price=40&passengers=1&affilid=picky&lang=en&currency=USD&booking_token=BH6d3ZbUWgOg05ck0nutzMR4nWvyYNTeEM_aYAd77NEcM60o7L5uTwn1n3qwVJJSXxQHxqIz78x2u1OxJ0GUu4sfBcHo8HjNSsF9H4Vai0ikkuKhcANGpQhfH-JUuXVibvGRT3DpV1MlmLQ7KSomq_gzNK3squKcjEoMh4xoG8zcpYlPFgVXRHEpBB1U-elSTs0tq9IPMmqPLTPuYP-PZfQxUcwyO3SSWEr1P5N1P24UpGqcyTLSc_RfzwnIj0xe4JAYifMo9eqtftdHuMQleLmgL6JNAYNcRJGeEitGpj8ScrCV-dHmybWwNdJcZOL_HtS8sY8aKH9SC9Rm0spEZ63VLPX_dGZ40s6BPR-Xc294MijvJi5f9l8IspbxGQqx6hpcYXcXrJeP1Hkva3Ckj6cXdNsUE0lbG-cDFbsMT_us9GBRpeuBx3MFYmZiGaD8BDj7QvuInX9KLexxdjgul-DTbx3AruY0U1cx3_X-CiQuBDUHAJXcJyY7d9PuRnoKCH15-YuwJaMGx7ykEKHy84iieVT_S9Uv-4R8ElVEUAXfnrFch1CANNx3D02B0oQRp-N3g-09jEQGmLvKd-d1Zcia3M3mpVz1VDdyfyy7_X8AkSx5x02LK0MiESKqV2_EFWGobFuw0GrYScsvJ_XuLgrmeWVhQszHfDKuYNPXo71U=",
        "trip_duration": 5,
        "flight_id": 242,
        "min_f": 30.400000000000034,
        "max_f": 34.99000000000001,
        "min_c": -1.599999999999966,
        "max_c": 2.990000000000009,
        "day_feels_like_c": -7.0499999999999545,
        "day_feels_like_f": 94.950000000000045,
        "description": "clear sky",
        "date": "2021-01-09T02:00:00+00:00"
      }
    }
   ]
  }
```

## How to Install GTFO-FE

GTFO-FE is hosted on [Heroku](https://gtfo-fe.herokuapp.com/), where you'll be able to view its functionality to the fullest.

For usage on your local machine follow the instructions listed below:

```
git clone git@github.com:GetThatFlightOut/GTFO-FE.git
cd GTFO-FE
bundle install
rake db:{create,migrate}
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
