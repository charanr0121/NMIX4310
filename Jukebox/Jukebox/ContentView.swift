//
//  ContentView.swift
//  Jukebox
//
//  Created by Charan Ramachandran on 4/6/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var size1Changed = false
    @State private var size2Changed = false
    @State private var size3Changed = false
    @State private var size4Changed = false
    
    @State private var circleColorChanged = false
    @State private var playOrPause = false
    
    @State var player: AVAudioPlayer?
    
    @State var firstClick = false
    
    @State var num = 0
    @State var songs = [["takecare", "Take Care (feat. Rihanna)"],["onedance", "One Dance (feat. Wizkid & Kyla)"],["rightaboveit", "Right Above It (feat. Drake)"],["whatsmyname", "What's My Name? (feat. Drake)"]]
    
    func playsound (thesong: String){
        let thepath = Bundle.main.path(forAuxiliaryExecutable: thesong)!
        let url = URL(fileURLWithPath: thepath)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    var body: some View {
        
        VStack {
            VStack(spacing: 70){
                HStack(spacing: 70){
                    Image(self.songs[0][0])
                        .scaleEffect(self.num == 0 && playOrPause ? 1.6 : 1.2)
                        .animation(.default)
                        .onTapGesture {
                            self.num = 0
                            self.player?.stop()
                            self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                            self.playOrPause = true
                            
                    }
                    Image(self.songs[1][0])
                        .scaleEffect(self.num == 1 && playOrPause ? 1.6 : 1.2)
                        .animation(.default)
                        .onTapGesture {
                            self.num = 1
                            self.player?.stop()
                            self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                            self.playOrPause = true
                    }
                    
                }
                HStack(spacing: 70){
                    Image(self.songs[2][0])
                        .scaleEffect(self.num == 2 && playOrPause ? 1.6 : 1.2)
                        .animation(.default)
                        .onTapGesture {
                            self.num = 2
                            self.player?.stop()
                            self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                            self.playOrPause = true
                    }
                    Image(self.songs[3][0])
                        .scaleEffect(self.num == 3 && playOrPause ? 1.6 : 1.2)
                        .animation(.default)
                        .onTapGesture {
                            self.num = 3
                            self.player?.stop()
                            self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                            self.playOrPause = true
                    }
                }
            }
            .frame(height: 400)
            HStack{
                Image(systemName: "backward.end.fill")
                    .font(.system(size: 50))
                    .frame(width:100, height: 100)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.num -= 1
                        if (self.num == -1) {
                            self.num = 3
                        }
                        self.player?.stop()
                        self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                        self.playOrPause = true
                }
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(playOrPause ? .red : Color(.systemGreen))
                    if playOrPause{
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                    } else {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                    }
                }
                .onTapGesture {
                    self.circleColorChanged.toggle()
                    self.playOrPause.toggle()
                    if (self.playOrPause == true) {
                        self.player?.play()
                        if (self.firstClick == false){
                            self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                            self.firstClick = true
                        }
                    } else {
                        self.player?.pause()
                    }
                }
                Spacer()
                Image(systemName: "forward.end.fill")
                    .font(.system(size: 50))
                    .frame(width:100, height: 100)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.num += 1
                        if (self.num == 4) {
                            self.num = 0
                        }
                        self.player?.stop()
                        self.playsound(thesong: "\(self.songs[self.num][0]).m4a")
                        self.playOrPause = true
                }
                
            }
        .padding()
            .animation(.default)
            HStack{
                Image(self.songs[self.num][0])
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
                Text(self.songs[self.num][1])
                Spacer()
            }
        .padding(43)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

