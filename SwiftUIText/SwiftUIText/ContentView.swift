//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Charan Ramachandran on 2/3/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
var quotes = ["Drink more water.","Stop eating so much.","Get 8 hours of sleep."]
struct ContentView: View {
    var body: some View {
        Text(quotes[2]).fontWeight(.heavy).font(.system(size: 50)).shadow(color: .gray, radius: 3, x: -3, y: 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
