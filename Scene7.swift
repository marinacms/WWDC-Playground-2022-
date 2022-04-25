//
//  scene7.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 12/04/22.
//

import SwiftUI

struct Scene7: View {
    @State private var showingSheet = false
    
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
                }.onAppear(){
                    showingSheet.toggle()
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
                            Thank you for helping Mari overcome these obstacles. Memories are really powerful and for sure now you've become memorable for her!

                            Don't forget to take time for yourself and do things you love, because then you can change the world with your story that only you can tell ❤️

                        """)
                        }
                    }
                    Spacer()
                }
            }.navigationBarHidden(true)
        }
    }
}
