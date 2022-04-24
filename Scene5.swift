//
//  Scene5.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 23/04/22.
//

import SwiftUI

struct Scene5: View {
    var body: some View {
        ZStack{
            Gif("animationBeach")
    //        soundManager.MusicPlayer(sound: "Good", type: "mp3")
            
            NavigationLink(destination: Scene6(), label:{
                Image("arrow3")
                    .position(x: 900, y: 1220)
        })
        }.navigationBarHidden(true)
        
        
        }
    }


