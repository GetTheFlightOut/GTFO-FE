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
        "qualitative_forecast": "sunny"
      }
    }
   ]
  }
```

## How to Install GTFO-BE
## Dependencies
## Testing
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

#### Todd Estes: [LinkedIn](https://www.linkedin.com/in/toddwestes/), [Email](elestes@gmail.com), [GitHub](Todd-Estes)

#### Connor Ferguson: [LinkedIn](https://www.linkedin.com/in/connor-p-ferguson/), [Email](cpfergus1@gmail.com), [GitHub](cpfergus1)

#### George Soderholm: [LinkedIn](https://www.linkedin.com/in/george-soderholm-05776947/), [Email](georgesoderholm@gmail.com), [GitHub](GeorgieGirl24)

#### Sage Freeman-Gonzales: [LinkedIn](https://www.linkedin.com/in/sagefreemangonzales/), [Email](sagegonzales15@gmail.com), [GitHub](SageOfCode)

#### Sheryl Stillman: [LinkedIn](https://www.linkedin.com/in/sherylstillman1/), [Email](sheryl.stillman@gmail.com), [GitHub](stillsheryl)

#### Aidan Murray:  [LinkedIn] , [Email](aidanhansm@gmail.com), [GitHub](TeknoServal)

#### Jesse Mellinger: [LinkedIn](https://www.linkedin.com/in/jesse-mellinger/), [Email](jesse.m.mellinger@gmail.com), [GitHub](JesseMellinger)

#### Nick King: [LinkedIn](https://www.linkedin.com/in/nick-king-3128501ba/), [Email](nickmaxking@gmail.com), [GitHub](nmking22)

#### Brian Liu: [LinkedIn](https://www.linkedin.com/in/brian-liu-8356287b/), [Email](brian.b.liu@gmail.com), [GitHub](badgerbreezy)

#### Will Dunlap: [LinkedIn](https://www.linkedin.com/in/willwdunlap/), [Email](dunlapww@gmail.com), [GitHub](dunlapww)

## Acknowledgments
