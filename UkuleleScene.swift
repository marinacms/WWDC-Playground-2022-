//
//  ukulele scene.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 12/04/22.
//

import SwiftUI
import AVFoundation

var ukuleleSong: AVAudioPlayer!
struct UkuleleScene: View {
    @ObservedObject var soundManager = SoundManager()
    
    var body: some View {
        ZStack {
            Gif("ukulele")
                .edgesIgnoringSafeArea(.vertical)
                .onTapGesture {
                    soundManager.MusicPlayer(sound: "Good", type: "mp3")
                }
            if soundManager.finishedPlaying {
                VStack{
                    Button(action: {
                        print("Next Screen!")
                    }
                    ){
                        Text("Get to next screen")
                            .font(.largeTitle)
                    }.padding(.top, 128)
                    Spacer()
                }
            } else {
                VStack{
                    Text("Touch on the screen to play the music!")
//                        .font(.largeTitle)
//                        .font(Fonte)
                        .padding(.top, 128)
                    Spacer()
                }
            }
            NavigationLink(destination: Scene5(), label:{
                Image("arrow3")
                    .position(x: 900, y: 1220)
        })
                
        }.navigationBarHidden(true)
    }
}
            
