//
//  weather.swift
//  thrhd
//
//  Created by 이동현 on 2022/06/04.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    let feels_like: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

