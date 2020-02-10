//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Charan Ramachandran on 2/10/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var img: String
    var txt: String
    var title: String
    var author: String
    var body: some View {
        VStack{
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack (alignment: .leading){
                    Text(txt)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(("Written by " + author ).uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
            .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(img: "swiftui-button", txt:"SwiftUI", title: "Drawing a Border with Rounded Corners", author: "Charan Ramachandran")
    }
}

