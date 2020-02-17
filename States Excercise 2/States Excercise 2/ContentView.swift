//
//  ContentView.swift
//  States Excercise 2
//
//  Created by Charan Ramachandran on 2/17/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var one = 0
    @State var two = 0
    @State var three = 0
    
    var body: some View {
        VStack {
            Text(String(one + two + three))
                .font(.system(size: 200, design: .rounded))
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    self.one += 1
                }) {
                    Circle()
                        .foregroundColor(Color("Mint"))
                        .frame(width: 100, height: 100)
                    .overlay(
                        Text(String(one))
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    )
                        
                }
                Button(action: {
                    self.two += 1
                }) {
                    Circle()
                        .foregroundColor(Color("Blue1"))
                        .frame(width: 100, height: 100)
                    .overlay(
                        Text(String(two))
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    )
                }
                Button(action: {
                    self.three += 1
                }) {
                    Circle()
                        .foregroundColor(Color("Blue2"))
                        .frame(width: 100, height: 100)
                    .overlay(
                        Text(String(three))
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
