Feature: Get geographical data of a country

  Background:

    * url api.baseUrl
    * path '/timezoneJSON'
    * params {username: "#(user.name)", formatted: true, lat: #(latitude), lng: #(longitude)}
    * def responseSuccessful = read("successful-response-get.json")
    * def responseDataColombia = read("response-data-colombia-get.json")
    * def responseFailedParameter = read("fail-parsing-parameter-get.json")

    Scenario Outline: Get geographical data of a country
      When method GET
      Then status 200
      And match response == responseSuccessful

      Examples:
      |latitude |  longitude |
      |   4     |    -72     |
      |   -70   |    40      |
      |   45    |    50      |
      |   8     |    -8f     |
      |   4.2   |    -72.5   |

    Scenario Outline: Get geographical data of a Colombia
      When method GET
      Then status 200
      And match response == responseDataColombia

      Examples:
      |latitude |  longitude |
      |   4     |    -72     |

    Scenario Outline: Get geographical data of a country with invalid parameters
      When method GET
      Then status 200
      And match response == responseFailedParameter

      Examples:
      |latitude |  longitude |
      |   ñ     |    -72     |
      |   -70   |     ñ      |
      |   A     |     a      |
      |   #     |     2      |
      |   4.2   |     #      |
      |   #     |     a      |
      |   a     |     #      |
      |   4     |   -a8f     |

    Scenario Outline: Get geographical data of a country that does not have information
      When method GET
      Then status 200
      And match response == {"status": {"message": "no timezone information found for lat/lng","value": 15}}

      Examples:
      |latitude |  longitude |
      |   90    |     70     |
      |   90    |     99     |

    Scenario Outline: Get geographical data of country with invalid latitude and longitude
      When method GET
      Then status 200
      And match response == {"status": {"message": "invalid lat/lng","value": 14}}

      Examples:
      |latitude |  longitude |
      |   81    |    901     |
      |  700    |    801     |
