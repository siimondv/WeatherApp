//
//  WeatherInfoViewModel.swift
//  WeatherApp
//
//  Created by Simon Delgado on 9/1/25.
//

import Foundation

final class WeatherInfoViewModel : ObservableObject {
    @Published var weatherInfo: WeatherInfo = .empty
    
    func fetchWeatherInfo() {
        
        guard let request = Request.weatherInfoRequest else { return }
        
        Service.shared.execute(request, expecting: GetWeatherInfoResponse.self){ [weak self] result in
            
            switch(result){
                
            case .success(let weatherInfoResponse):
                self?.weatherInfo = WeatherInfoMapper.map(response: weatherInfoResponse)
            case .failure(let error):
                print("Failed to fetch weather info: \(error.localizedDescription)")
            }
            
        }
    }
    
}
