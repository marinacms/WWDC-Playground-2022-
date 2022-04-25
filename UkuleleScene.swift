//
//  ukulele scene.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 12/04/22.
//

import SwiftUI
import AVFoundation
import UIKit

var ukuleleSong: AVAudioPlayer!
struct UkuleleScene: View {
    @ObservedObject var soundManager = SoundManager()
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            Gif("ukulele")
                .edgesIgnoringSafeArea(.vertical)
                .onTapGesture {
                    soundManager.MusicPlayer(sound: "Good", type: "mp3")
                }
            if soundManager.finishedPlaying {
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: Scene5(), label:{
                            Image("arrow3")
                        })
                    }                }
            } else {
                VStack{
                    Text("Touch on the screen to play the music!")
                        .font(.largeTitle)
                        .padding(.top, 128)
                    Spacer()
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "book.fill")
                            .font(.largeTitle)
                            .padding()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SheetView(text: """
                            How about now we relive those moments with Mari and help her remember what she is capable of doing and also what she loves?
                            She learned to play the ukulele recently, even though she thought she wouldn't be able to, but she insisted and she did. Let's hear her first song! 🎧

                            💡NOTE: Tap anywhere on the screen to listen and don't forget to turn up the volume for a better experience.
                        """)
                    }
                }
                Spacer()
            }
                
        }.navigationBarHidden(true)
    }
}
            
