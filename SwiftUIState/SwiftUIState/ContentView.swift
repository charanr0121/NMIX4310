//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Charan Ramachandran on 2/17/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    
    @State private var numPressed = 0
    
    var body: some View {
        VStack{
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 150))
                    .foregroundColor(isPlaying ? .red : .green)
            }
            .frame(width: 150, height: 150)
            Button(action: {
                self.numPressed += 1
            }) {
                Circle()
                    .frame(width: 150, height: 150) .foregroundColor(.blue) .overlay(
                        Text(String(numPressed))
                            .font(.system(size: 70, weight: .bold, design: .rounded)) .foregroundColor(.white)
                )
            }
            Button(action: {
                self.numPressed += 1
            }) {
                Circle()
                    .frame(width: 150, height: 150) .foregroundColor(.purple) .overlay(
                        Text(String(numPressed))
                            .font(.system(size: 70, weight: .bold, design: .rounded)) .foregroundColor(.white)
                )
            }
            Button(action: {
                self.numPressed += 1
            }) {
                Circle()
                    .frame(width: 150, height: 150) .foregroundColor(.red) .overlay(
                        Text(String(numPressed))
                            .font(.system(size: 70, weight: .bold, design: .rounded)) .foregroundColor(.white)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
