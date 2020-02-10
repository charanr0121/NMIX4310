//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Charan Ramachandran on 2/3/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            HeaderView()
            HStack (spacing: 15){
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                ZStack {
                PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/355))
                    .cornerRadius(2)
                    .offset(y: 87)
                }
            }
            PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
            Text("Perfect for teams with 20 members")
                .font(.system(.caption, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/355))
            .cornerRadius(2)
                .offset(x:0, y: -35)
            Spacer()

        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
    }
}

struct BasicView: View {
    var body: some View {
        VStack {
            Text("Basic")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
            Text("$9")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            Text("per month")
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(40)
        .background(Color.purple)
        .cornerRadius(10)
    }
}

struct ProView: View {
    var body: some View {
        VStack {
            Text("Pro")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Text("$19")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
            Text("per month")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding(40)
        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
        .cornerRadius(10)
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)


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
            icon.map({ Image(systemName: $0)
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
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
