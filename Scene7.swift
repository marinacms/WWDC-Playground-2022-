//
//  scene7.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 12/04/22.
//

import SwiftUI

struct Scene7: View {
    var body: some View {
        GeometryReader{ reader in
        ZStack {
            VStack{
                Gif("animation3")
                    .overlay(
                        Image("chat3")
                            .padding(.leading, reader.size.width*0.57)
                            .padding(.bottom, reader.size.height*0.46),
                        alignment: .bottomLeading)
            }
        }.navigationBarHidden(true)
    }
}
}
