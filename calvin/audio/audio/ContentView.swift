//
//  ContentView.swift
//  audio
//
//  Created by Emuela on 10/14/19.
//  Copyright © 2019 Emuela. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var twist: AVAudioPlayer?
    @State var demo = "whatever"
    
    func playsound (thesong: String){
        let thepath = Bundle.main.path(forAuxiliaryExecutable: thesong)!
    let url = URL(fileURLWithPath: thepath)
    do {
        twist = try AVAudioPlayer(contentsOf: url)
        twist?.play()
    } catch {
        // couldn't load file :(
    }
    }

    func stopsound(){
        twist?.stop()
    }
    func paws(){
        twist?.pause()
    }
    func player(){
        twist?.play()
    }
    func hello() {
        demo = "do something"
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 55.0){
            HStack(spacing: 21.0){  VStack {
                Button(action: {
                    self.playsound(thesong: "stones.m4a")
                    self.hello()
                    
                }) {
                   VStack {
                    Text("Twist")
                        .font(.title)
                     Text("Chubby Checker")
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        Image("chubby")
                        .renderingMode(.original)
                    }
                }
            }
            
                VStack(spacing: 22.0) {
                Button(action: {
                    self.playsound(thesong: "twistshout.mp3")
                    self.hello()
                    
                }) {
                   VStack {
                    Text("Twist Again")
                        .font(.title)
                    Text("The Beatles")
                        .lineLimit(2)
                        Image("beatles")
                            .renderingMode(.original)
                            .frame(height: 207.0)
                    }
                }
            }
         
            }
                HStack(spacing: 21.0){  VStack {
                    Button(action: {
                        self.playsound(thesong: "walkthisway.mp3")
                        self.hello()
                        
                    }) {
                       VStack {
                        Text("Walk this Way ")
                            .font(.title)
                                Text("Aerosmith ")
                          
                            Image("aerosmith")
                                .renderingMode(.original)
                                .frame(height: 190.0)
                        }
                    }
                }
                
                VStack {
                    Button(action: {
                        self.playsound(thesong: "dancingqueen.mp3")
                        self.hello()
                        
                    }) {
                       VStack {
                        Text("Dancing Queen")
                            .font(.title)
                             Text("Abba")
                            .lineLimit(3)
                            Image("abba")
                            .renderingMode(.original)
                        }
                    }
                }
              
                }
            }
            HStack(spacing: 11.0) {
                Button(action: stopsound) {
                    Text("Stop")
                }
                Button(action: paws) {
                    Text("Pause")
                }
                Button(action: player) {
                    Text("Play")
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
