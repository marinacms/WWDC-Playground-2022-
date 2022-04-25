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
                        Mudar texto
                        """)
                    }
                }
                Spacer()
            }
                
        }.navigationBarHidden(true)
    }
}
            
