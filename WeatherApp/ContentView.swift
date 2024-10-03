//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jayesh Kriplani on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            // Background color
            BackgroundView(isNight: isNight)
            
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temparature: isNight ? 50 : 76)
                
                HStack(spacing: 25) {
                    WeatherDayView()
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    let weatherData : [WeatherModel] = [
        WeatherModel(dayOfWeek: "TUE", temparature: 74),
        WeatherModel(dayOfWeek: "WED", temparature: 88),
        WeatherModel(dayOfWeek: "THU", temparature: 55),
        WeatherModel(dayOfWeek: "FRI", temparature: 60),
        WeatherModel(dayOfWeek: "SAT", temparature: 25)
    ]
    
    
    var body: some View {
        
        ForEach(weatherData) { weather in
            VStack() {
                Text(weather.dayOfWeek)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                
                Image(systemName: weather.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(weather.temparature)°")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temparature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original) // The picture becomes colorful
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temparature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 50)
    }
}
