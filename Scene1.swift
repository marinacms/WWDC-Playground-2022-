//
//  Scene1.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 22/04/22.
//

import SwiftUI

struct Scene1: View {
    @State var cont = 0
    
    var body: some View {
        GeometryReader{ reader in
            ZStack {
                if cont == 0 {
                    Gif("animation1")
                        .overlay(
                            Image("chat1")
                                .padding(.leading, reader.size.width*0.02)
                                .padding(.bottom, reader.size.height*0.50),
                            alignment: .bottomLeading)
                }
                
                if cont == 1 {
                    Gif("animation1")
                        .overlay(
                            Image("chat12")
                                .padding(.leading, reader.size.width*0.02)
                                .padding(.bottom, reader.size.height*0.50),
                            alignment: .bottomLeading)
                }
                
                if cont == 2 {
                    Gif("animation1")
                        .overlay(
                            Image("chat2")
                                .padding(.leading, reader.size.width*0.55)
                                .padding(.bottom, reader.size.height*0.28),
                            alignment: .bottomLeading)
                }
                
                if cont == 3 {
                    Gif("animation1")
                        .overlay(
                            Image("chat22")
                                .padding(.leading, reader.size.width*0.55)
                                .padding(.bottom, reader.size.height*0.28),
                            alignment: .bottomLeading)
                }
                
                if cont < 3 {
                    VStack {
                        Spacer()
                        HStack(alignment: .bottom, spacing: 16) {
                            if(cont > 0 && cont < 4) {
                                Button(action: {
                                    cont -= 1
                                }
                                ){
                                    Image("arrow1")
                                        .rotationEffect(.degrees(-180))
                                }
                            }
                            Button(action: {
                                cont += 1
                            }
                            ){
                                Spacer()
                                Image("arrow1")
                                
                            }
                        }
                    }
                } else {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: Scene2(), label:{
                                Image("arrow1")
                            })
                        }
                    }
                }
            }
            
        }.navigationBarHidden(true)
    }
}


