//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Simon Delgado on 9/1/25.
//

import SwiftUI

struct WeatherInfoView: View {
    
    @StateObject var weatherInfoViewModel = WeatherInfoViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text(weatherInfoViewModel.weatherInfo.locationName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(weatherInfoViewModel.weatherInfo.weatherDescription)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 20) {
                if let url = weatherInfoViewModel.weatherInfo.iconURL {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }

                VStack {
                    Text("\(weatherInfoViewModel.weatherInfo.temperature, specifier: "%.1f")°C")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.primary)

                    HStack {
                        Text("H: \(weatherInfoViewModel.weatherInfo.maxTemperature, specifier: "%.1f")°C")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("L: \(weatherInfoViewModel.weatherInfo.minTemperature, specifier: "%.1f")°C")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }

            HStack {
                VStack {
                    Image(systemName: "sunrise.fill")
                        .foregroundColor(.orange)
                    Text(weatherInfoViewModel.weatherInfo.sunriseTime, style: .time)
                }

                Spacer()

                VStack {
                    Image(systemName: "sunset.fill")
                        .foregroundColor(.orange)
                    Text(weatherInfoViewModel.weatherInfo.sunsetTime, style: .time)
                }
            }
            .padding(.horizontal, 70)

            HStack {
                Image(systemName: "drop.fill")
                    .foregroundColor(.blue)
                Text("Humidity: \(weatherInfoViewModel.weatherInfo.humidity)%")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            LinearGradient(colors: [.white, .yellow], startPoint: .leading, endPoint: .bottomTrailing)
        )
        .task {
            await weatherInfoViewModel.fetchWeatherInfo()
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
