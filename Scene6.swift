//
//  Scene6.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 19/04/22.
//

import SwiftUI
import UIKit

struct Scene6: View {
    @State var cont = 0
    @State private var position: CGPoint = CGPoint(x: -110, y: 555)
    @State private var positionB: CGPoint = CGPoint(x: 480, y: 1120)
    @State private var positionC: CGPoint = CGPoint(x: 385, y: 965)
    @State private var positionD: CGPoint = CGPoint(x: 115, y: 400)
    @State private var positionE: CGPoint = CGPoint(x: 100, y: 515)
    
    @State private var isDragging = false
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("flowerTape")
                        .position(positionB)
                        .gesture(dragB)
                    Image("borbTape")
                        .position(positionC)
                        .gesture(dragC)
                }.onAppear(){
                    showingSheet.toggle()
                }
                HStack{
                    Image("pinkTape")
                        .position(positionD)
                        .gesture(dragD)
                    Image("textTape")
                        .position(position)
                        .gesture(drag)
                    Image("paperTape")
                        .zIndex(-1)
                        .position(positionE)
                        .gesture(dragE)
                }.zIndex(-1)
                    .padding(.bottom, 10)
            }
            if cont > 3 {
                VStack{
                    Spacer()
                    Text("Wow, it's amazing!")
                        .fontWeight(.medium)
                        .font(.largeTitle)
                    HStack {
                        Spacer()
                        NavigationLink(destination: Scene7(), label:{
                            Image("arrow4").padding()
                        })
                    }
                }
            } else {
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
                                Mari always takes the time to create collages and exercise her creativity even more ✨

                                💡Note: drag the elements to the notebook and help her in this creative exercise!
                            """)
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
            .background(Image("collageArea"))
        
    }
    
    func isNearTo(_ position: CGPoint, goal: CGPoint) -> Bool {
        return position.distance(to: goal) < 350
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.position = value.location
            }
            .onEnded { value in
                if (isNearTo(self.position, goal: .init(x: 140, y: -44))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
    
    var dragB: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.positionB = value.location
            }
            .onEnded { value in
                if (isNearTo(self.positionB, goal: .init(x: 510, y: 675))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
    
    var dragC: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.positionC = value.location
            }
            .onEnded { value in
                if (isNearTo(self.positionC, goal: .init(x: -20, y: 645))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
    
    var dragD: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.positionD = value.location
            }
            .onEnded { value in
                if (isNearTo(self.positionD, goal: .init(x: 500, y: 0))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
    
    var dragE: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.positionE = value.location
                
            }
            .onEnded { value in
                if (isNearTo(self.positionE, goal: .init(x: -180, y: 0))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
}
