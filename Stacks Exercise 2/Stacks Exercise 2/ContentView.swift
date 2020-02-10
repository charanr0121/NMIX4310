//
//  ContentView.swift
//  Stacks Exercise 2
//
//  Created by Charan Ramachandran on 2/10/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack{
                PricingView(title:"Basic", price: "$9", textColor: .white, bgColor: .purple, icon: "tortoise.fill")
                PricingView(title:"Pro", price: "$19", textColor: .white, bgColor: .yellow, icon: "hare.fill")
                    .offset(y: 110)
                PricingView(title:"Team", price: "$299", textColor: .white, bgColor: Color(red:62/255, green: 63/255, blue: 70/255), icon: "bolt.fill")
                    .offset(y: 220)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            icon.map({
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            })
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 300)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
