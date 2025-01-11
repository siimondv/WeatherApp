//
//  GetWeatherInfoResponse.swift
//  WeatherApp
//
//  Created by Simon Delgado on 9/1/25.
//

import Foundation

struct GetWeatherInfoResponse: Codable {
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let timezone: Double
    let locationName: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case sys
        case timezone
        case locationName = "name"
    }
}

struct Weather: Codable {
    let weatherDescription: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case iconURL = "icon"
    }
}

struct Main: Codable {
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let humidity: Int
    
    enum CodingKeys : String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity
    }
}


struct Sys: Codable {
    let sunriseTime: Date
    let sunsetTime: Date
    
    enum CodingKeys : String, CodingKey {
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
    }
}
