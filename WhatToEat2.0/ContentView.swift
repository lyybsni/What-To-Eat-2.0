//
//  ContentView.swift
//  WhatToEat2.0
//
//  Created by lyy on 14/3/2020.
//  Copyright © 2020 City-University-Of-Hong-Kong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var rating: Double = 0
    
    var body: some View {
        
        VStack {
            Text("Restaurant Creation")

            TextField("Restaurant Name", text: $name)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 5))
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Restaurant: Codable{
    var name: String
    var rating: Double
    // TODO:
    // var distance: Double
    
    var menu: [Dish] = [];
    var grades: [Double] = [];
    
    /// return the rating of the restaurant
    func getRating() -> Double{
        let sum: Double = grades.reduce(0, +)
        if sum == 0 {
            /// unable to fetch the previous rankings, return -1
            return -1
        } else {
            /// else, return the average ranking of the restaurant
            return sum/Double(grades.count)
        }
    }
}

struct Dish: Codable{
    var name: String
    var price: Double
    
    // TODO:
    // var picture: Data (<-change UImage to Data
    
    enum favor{
        case SPICY
        case SWEET
        case SALTY
    }
}
