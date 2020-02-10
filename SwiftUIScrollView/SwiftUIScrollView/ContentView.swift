//
//  ContentView.swift
//  SwiftUIScrollView
//
//  Created by Charan Ramachandran on 2/10/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: -25){
            HStack {
                VStack (alignment: .leading){
                    Text("Monday, Aug 20".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Your Reading")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                }
                Spacer()
            }
            .padding()
            ScrollView (.horizontal, showsIndicators: false) {
                HStack{
                    CardView(img: "swiftui-button", txt:"SwiftUI", title: "Drawing a Border with Rounded Corners", author: "Charan Ramachandran").frame(width: 300)
                    CardView(img: "macos-programming", txt:"macOS", title: "Building a Simple Editing App", author: "Nikita Tallapally").frame(width: 300)
                    CardView(img: "flutter-app", txt:"Flutt", title: "Building a Complex Layout with Flutter", author: "Femi Oldurosi").frame(width: 300)
                    CardView(img: "natural-language-api", txt:"iOS", title: "What's New in Natural Language API", author: "Varun Ramachandran").frame(width: 300)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
