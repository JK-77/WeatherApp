//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jayesh Kriplani on 03/10/24.
//

import Foundation

struct WeatherModel: Identifiable {
    let id = UUID()
    let dayOfWeek : String
    let temparature : Int
    
    var imageName: String {
        switch temparature {
            
        case 25...35:
            return "snow"
        case 36...45:
            return "wind.snow"
        case 46...55:
            return "wind.snow"
        case 55...60:
            return "sunset.fill"
        case 61...74:
            return "cloud.sun.fill"
        case 75...90:
            return "sun.max.fill"
            
        default:
            return "questionmark.diamond.fill"
        }
    }
}
