//
//  Scene2.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 22/04/22.
//

import SwiftUI

struct Scene2: View {
    var body: some View {
        ZStack{
                Image("polaroids")
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: Scene3(), label:{
                        Image("arrow1")
                    })
                }
            }
        }.navigationBarHidden(true)
    }
}
