//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Charan Ramachandran on 2/17/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                print("plus button tapped!")
            }) {
                Image(systemName: "plus")
            }
            .buttonStyle(PlusButtonStyle())
            Button(action: {
                print("share button tapped!")
            }) {
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            Button(action: {
                print("edit button tapped!")
            }) {
                HStack{
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                    Text("Edit")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            Button(action: {
                print("delete button tapped!")
            }) {
                HStack{
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                
            }
            .buttonStyle(GradientBackgroundStyle())
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Peach"), Color("Strawberry")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct PlusButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color(.purple))
            .clipShape(Circle())
            .rotationEffect(configuration.isPressed ? Angle(degrees: 45) : Angle(degrees: 0))
        
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
