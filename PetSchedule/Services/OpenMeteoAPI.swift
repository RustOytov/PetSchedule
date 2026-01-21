//
//  OpenMeteoAPI.swift
//  PetSchedule
//
//  Created by Polaroytov on 1/20/26.
//
import SwiftUI
import Foundation

struct WeatherResponse: Codable {
    let latitude: Double
    let longitude: Double
    let hourly: Hourly
}

struct Hourly: Codable {
    let time: [String]
    let temperature_2m: [Double]
}

enum WeatherServiceErrors: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
}

final class OpenMeteoAPI {
    static let shared = OpenMeteoAPI()
    @AppStorage("appLatitude") var appLatitude = 0.0
    @AppStorage("appLongitude") var appLongitude = 0.0
    
    private let baseUrl = ""
    
    
    func fetchWeather() async throws -> WeatherResponse {
        var components = URLComponents(string: baseUrl)
        components?.queryItems = [
            URLQueryItem(name: "latitude", value: "\(appLatitude)"),
            URLQueryItem(name: "longitude", value: "\(appLongitude)"),
            URLQueryItem(name: "forecast_days", value: "1"),
            URLQueryItem(name: "hourly", value: "temperature_2m,weather_code"),
        ]
        
        guard let url = components?.url else {
            throw WeatherServiceErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let res = try JSONDecoder().decode(WeatherResponse.self, from: data)
            print(res)
            return res
        } catch {
            throw WeatherServiceErrors.decodingFailed
        }
    }
}
