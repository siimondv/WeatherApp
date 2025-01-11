//
//  WeatherInfoMapper.swift
//  WeatherApp
//
//  Created by Simon Delgado on 10/1/25.
//

import Foundation

class WeatherInfoMapper {
    static func map(response: GetWeatherInfoResponse) -> WeatherInfo {
        guard let weather = response.weather.first else {
            return .empty
        }
        

        let sunriseWithTimezone = response.sys.sunriseTime.addingTimeInterval(response.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunsetWithTimezone = response.sys.sunsetTime.addingTimeInterval(response.timezone - Double(TimeZone.current.secondsFromGMT()))
        
        return WeatherInfo(
            locationName: response.locationName,
            iconURL: URL(string: "https://openweathermap.org/img/wn/\(weather.iconURL)@2x.png"),
            weatherDescription: response.weather.first?.weatherDescription ?? "Unknown",
            temperature: response.main.temperature,
            maxTemperature: response.main.maxTemperature,
            minTemperature: response.main.minTemperature,
            sunriseTime: sunriseWithTimezone,
            sunsetTime: sunsetWithTimezone,
            humidity: response.main.humidity
        )
    }
}


