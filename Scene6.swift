//
//  Scene6.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 19/04/22.
//

import SwiftUI
import UIKit

struct Scene6: View {
    @State private var position: CGPoint = CGPoint(x: 125, y: 0)
    @State private var positionB: CGPoint = CGPoint(x: 125, y: 0)
    @State private var positionC: CGPoint = CGPoint(x: 125, y: 0)
    @State private var positionD: CGPoint = CGPoint(x: 125, y: 0)
    @State private var positionE: CGPoint = CGPoint(x: 125, y: 0)
    @State private var positionF: CGPoint = CGPoint(x: 125, y: 0)
    
    func isNearTo(_ position: CGPoint, goal: CGPoint) -> Bool {
        return position.distance(to: goal) < 250
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.position = value.location
                print("LOCATION \(value.location)")
                
                if(isNearTo(self.position, goal: .init(x: 500, y: 475))) {
                    print("figurinha dentro do caderno")
                }
            }
    }
    
    var dragB: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionB = value.location
            }
    }
    
    var dragC: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionC = value.location
            }
    }
    
    var dragD: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionD = value.location
            }
    }
    
    var dragE: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionE = value.location
            }
    }
    
    var dragF: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionF = value.location
            }
    }
    
    @State private var isDragging = false
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            HStack{
                Image("areTape")
                    .position(position)
                    .gesture(drag)
                Image("heartTape")
                    .position(positionB)
                    .gesture(dragB)
                Image("powerTape")
                    .position(positionC)
                    .gesture(dragC)
                
            }
            HStack{
                Image("memoriesTape")
                    .position(positionD)
                    .gesture(dragD)
                Image("tape")
                    .position(positionE)
                    .gesture(dragE)
            }.padding(.bottom, 32)
            
            NavigationLink(destination: Scene7(), label:{
                Image("arrow4")
                    .position(x: 900, y: 1220)
        })
            
        }.navigationBarHidden(true)
        .background(Image("collageArea"))
        
    }


}

