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
    @State private var position: CGPoint = CGPoint(x: 200, y: 1210)
    @State private var positionB: CGPoint = CGPoint(x: 85, y: 1100)
    @State private var positionC: CGPoint = CGPoint(x: 190, y: 920)
    @State private var positionD: CGPoint = CGPoint(x: 110, y: 400)
    @State private var positionE: CGPoint = CGPoint(x: 225, y: 500)
    
    func isNearTo(_ position: CGPoint, goal: CGPoint) -> Bool {
        return position.distance(to: goal) < 370
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                print(value.location)
                self.position = value.location
                
            }
            .onEnded { value in
                if (isNearTo(self.position, goal: .init(x: 470, y: 630))) {
                    print("dentro")
                    cont += 1
                }
            }
    }
    
    var dragB: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionB = value.location
                cont += 1
            }
    }
    
    var dragC: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionC = value.location
                cont += 1
            }
    }
    
    var dragD: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionD = value.location
                cont += 1
            }
    }
    
    var dragE: some Gesture {
        DragGesture()
            .onChanged { value in
                self.positionE = value.location
                cont += 1
            }
    }
    
    @State private var isDragging = false
    var body: some View {
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
                
            }
            HStack{
                Image("pinkTape")
                    .position(positionD)
                    .gesture(dragD)
                Image("textTape")
                    .position(position)
                    .gesture(drag)
                Image("paperTape")
                    .position(positionE)
                    .gesture(dragE)
            }.padding(.bottom, 10)
            
            
            
        }.navigationBarHidden(true)
            .background(Image("collageArea"))
        
        if cont > 5 {
            VStack {
                Spacer()
                Text("Congratulations!")
                HStack {
                    Spacer()
                    NavigationLink(destination: Scene7(), label:{
                        Text("Finish")
                    })
                    
                }
                
            }
            
            
        }
        
    }
}
