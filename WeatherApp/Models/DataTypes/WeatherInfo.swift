//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Simon Delgado on 10/1/25.
//

import Foundation

struct WeatherInfo {
    let locationName: String
    let iconURL : URL?
    let weatherDescription: String
    let temperature: Double
    let maxTemperature: Double
    let minTemperature: Double
    let sunriseTime: Date
    let sunsetTime: Date
    let humidity: Int
}


extension WeatherInfo {
    static let empty :WeatherInfo = .init(locationName: "", iconURL: nil, weatherDescription: "", temperature: 0, maxTemperature: 0, minTemperature: 0, sunriseTime: Date(), sunsetTime: Date(), humidity: 0)
}
