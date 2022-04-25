//
//  Scene5.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 23/04/22.
//

import SwiftUI
import AVFoundation

struct Scene5: View {
    var soundManager = SoundManager()
    
    var body: some View {
        ZStack {
            Gif("animationBeach")
            VStack {
                Text("Listen to the sea and relax with Mari")
                    .padding(.top, 225)
                    .font(Font.largeTitle.weight(.black))
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: Scene6(), label:{
                        Image("arrow3")
                    })
                }
            }
        }.navigationBarHidden(true)
            .onAppear(perform: playMusicOnStart)
    }
    
    private func playMusicOnStart() {
        soundManager.MusicPlayer(sound: "ambienteWwdc", type: "mp3")
    }
    
}


