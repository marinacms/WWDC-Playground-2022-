//
//  Scene3.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 13/04/22.
//

import SwiftUI
import UIKit

class Poladoid{
    var polaroid: Image?
    var tapes: Image?
    
    init(polaroid: Image, tapes: Image){
        self.polaroid = polaroid
        self.tapes = tapes
    }
}

//func drop(polaroid: Image, tapes: Image){
////    var largP
////    var altP
//}

struct Scene3: View {
    @State var cont = 0
    var relaxingPolaroid = Poladoid(polaroid: Image("RelaxingPolaroid"),
                                    tapes: Image("relaxmyTape"))
    var polaroidUkulele = Poladoid(polaroid: Image("polaroidUkulele"),
                                   tapes: Image("ukuleleTape"))
    var polaroidCollage = Poladoid(polaroid: Image("collagePolaroidd_1"),
                                   tapes: Image("collageTape"))
    
    var fakes: [Poladoid] = [
        Poladoid(polaroid: Image("fakeTape"), tapes:  Image("musicTape")),
        Poladoid(polaroid: Image("fakeTape"), tapes: Image("foodandFriendTape")),
        Poladoid(polaroid: Image("fakeTape"), tapes: Image("beachTape"))
    ]
    var screenWidth = UIScreen.main.bounds.width
    
    @State private var location: CGPoint = CGPoint(x: 125, y: 45)
    @State private var locationB: CGPoint = CGPoint(x: 125, y: 45)
    @State private var locationC: CGPoint = CGPoint(x: 125, y: 45)
    @State private var locationD: CGPoint = CGPoint(x: 125, y: 0)
    @State private var locationE: CGPoint = CGPoint(x: 125, y: 0)
    @State private var locationF: CGPoint = CGPoint(x: 125, y: 0)
    
    func isNearTo(_ position: CGPoint, goal: CGPoint) -> Bool {
        return position.distance(to: goal) < 70
    }
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
            .onEnded { value in
                print("LOCATIONaaa \(value.location)")
                if(isNearTo(self.location, goal: .init(x: 120, y: -117))) {
                    self.location = .init(x: 120, y: -117)
                    cont += 1
                }
                else if (isNearTo(self.location, goal: .init(x: 442, y: -114)) ||
                         isNearTo(self.location, goal: .init(x: 766, y: -115))) {
                    self.location = .init(x: 125, y: 45)
                }
            }
    }
    
    var simpleDragB: some Gesture {
        DragGesture()
            .onChanged { value in
                print("LOCATIONaaa \(value.location)")
                self.locationB = value.location
            }
            .onEnded { value in
                if(isNearTo(self.locationB, goal: .init(x: 459, y: -116)) ||
                   isNearTo(self.locationB, goal: .init(x: 129, y: -121)) ||
                   isNearTo(self.locationB, goal: .init(x: -194, y: -115)))  {
                    self.locationB = .init(x: 125, y: 45)
                }
            }
    }
    
    var simpleDragC: some Gesture {
        DragGesture()
            .onChanged { value in
                print("LOCATIONaaa \(value.location)")
                self.locationC = value.location
            }
            .onEnded { value in
                if(isNearTo(self.locationC, goal: .init(x: -184, y: -116))) {
                    self.locationC = .init(x: -184, y: -116)
                    cont += 1
                }
                
                else if (isNearTo(self.locationC, goal: .init(x: 142, y: -117)) ||
                         isNearTo(self.locationC, goal: .init(x: -513, y: -113))) {
                    self.locationC = .init(x: 125, y: 45)
                }
            }
    }
    
    var simpleDragD: some Gesture {
        DragGesture()
            .onChanged { value in
                print("LOCATIONaaa \(value.location)")
                self.locationD = value.location
            }
            .onEnded { value in
                if(isNearTo(self.locationD, goal: .init(x: 444, y: -247)) ||
                   isNearTo(self.locationD, goal: .init(x: 771, y: -248)) ||
                   isNearTo(self.locationD, goal: .init(x: 116, y: -248)))  {
                    self.locationD = .init(x: 125, y: 0)
                }
            }
    }
    
    var simpleDragE: some Gesture {
        DragGesture()
            .onChanged { value in
                print("LOCATION \(value.location)")
                self.locationE = value.location
            }
            .onEnded { value in
            if(isNearTo(self.locationE, goal: .init(x: 455, y: -248))) {
                    self.locationE = .init(x: 457, y: -248)
                cont += 1
                }
                else if (isNearTo(self.locationE, goal: .init(x: 132, y: -246)) ||
                         isNearTo(self.locationE, goal: .init(x: -198, y: -249))) {
                    self.locationE = .init(x: 125, y: 0)
                }
                
            }
    }
    
    var simpleDragF: some Gesture {
        DragGesture()
            .onChanged { value in
                self.locationF = value.location
            }
            .onEnded { value in
                if(isNearTo(self.locationF, goal: .init(x: 137, y: -250)) ||
               isNearTo(self.locationF, goal: .init(x: -186, y: -244)) ||
                   isNearTo(self.locationF, goal: .init(x: -510, y: -243)))  {
                    self.locationF = .init(x: 125, y: 0)
                }
            }
    }
    
    @State private var isDragging = false
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 24) {
                    relaxingPolaroid.polaroid
                    polaroidUkulele.polaroid
                        .rotationEffect(.degrees(0))
                    polaroidCollage.polaroid
                }.padding(.bottom, 50)
                
                HStack(spacing: 48) {
                    relaxingPolaroid.tapes
                        .position(location)
                        .gesture(simpleDrag)
                    
                    fakes[2].tapes
                        .position(locationB)
                        .gesture(simpleDragB)
                    
                    polaroidUkulele.tapes
                        .position(locationC)
                        .gesture(simpleDragC)
                        .rotationEffect(.degrees(0))
                    
                }.padding(.horizontal, 64)
                    .frame(width: screenWidth, height: 125, alignment: .center)
                
                HStack(spacing: 48) {
                    fakes[0].tapes
                        .position(locationD)
                        .gesture(simpleDragD)
                    Image("collageTape")
                        .position(locationE)
                        .gesture(simpleDragE)
                        .rotationEffect(.degrees(0))
                    fakes[1].tapes
                        .position(locationF)
                        .gesture(simpleDragF)
                }.padding(.horizontal, 64)
                    .frame(width: screenWidth, height: 125, alignment: .center)
            }.background(Image("backScene3"))
                .navigationBarHidden(true)
            
            if cont == 3 {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: UkuleleScene(), label:{
                            Image("arrow2")
                        })
                    }
                }
            }
        }
    }
}


extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}


