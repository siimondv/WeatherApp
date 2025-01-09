//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Simon Delgado on 9/1/25.
//

import SwiftUI

struct WeatherInfoView: View {
    // MARK: - Mock Data
    let locationName: String
    let weatherDescription: String
    let weatherIcon: String
    let temperature: Double
    let maxTemperature: Double
    let minTemperature: Double
    let sunriseTime: String
    let sunsetTime: String
    let humidity: Int

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text(locationName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(weatherDescription)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 20) {
                Image(systemName: weatherIcon) icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                VStack {
                    Text("\(temperature, specifier: "%.1f")°C")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.primary)

                    HStack {
                        Text("H: \(maxTemperature, specifier: "%.1f")°C")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("L: \(minTemperature, specifier: "%.1f")°C")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }

            HStack {
                VStack {
                    Image(systemName: "sunrise.fill")
                        .foregroundColor(.orange)
                    Text(sunriseTime)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }

                Spacer()

                VStack {
                    Image(systemName: "sunset.fill")
                        .foregroundColor(.orange)
                    Text(sunsetTime)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal, 40)

            HStack {
                Image(systemName: "drop.fill")
                    .foregroundColor(.blue)
                Text("Humidity: \(humidity)%")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            LinearGradient(colors: [.white, .yellow], startPoint: .leading, endPoint: .bottomTrailing)
        )
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(
            locationName: "New York City",
            weatherDescription: "Sunny",
            weatherIcon: "sun.max.fill",
            temperature: 25.0,
            maxTemperature: 28.0,
            minTemperature: 18.0,
            sunriseTime: "06:45 AM",
            sunsetTime: "07:30 PM",
            humidity: 60
        )
    }
}
