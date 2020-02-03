//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Charan Ramachandran on 2/3/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: 300)
            .overlay(
                Rectangle()
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
                    .overlay(
                        Text("Paris")
                            .fontWeight(.heavy)
                            .font(.system(.headline))
                            .foregroundColor(.white)
                            .padding()
                            .opacity(0.8)
                            .padding()
                            .frame(width: 200),
                        alignment: .center ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
