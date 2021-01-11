# GTFO-FE

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

  ### API Endpoints pulled from backend

  Current API data pulled from the backend structure is:

  ```
   {
    "data": [{

      "id": 123467,
      "datetime_departure": "2021-01-07T16:45:10-07:00",
      "datetime_arrival": "2021-01-07T16:47:12-07:00",
      "departure_loc": {
        "city": "Denver, CO",
        "airport": "DEN"
      },
      "arrival_loc": {
        "city": "Las Vegas, NV",
        "airport": "LAS"
      },
      "airlines": {
        "to": "frontier",
        "back": "frontier"
      },
      "price": 48,
      "seat_availability": 7,
      "duration": "2h 1m",
      "average_forecast": {
        "is_available": true,
        "average_temp": 65,
        "description": "sunny"
      }
    }
   ]
  }
```

## How to Install GTFO-BE
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
