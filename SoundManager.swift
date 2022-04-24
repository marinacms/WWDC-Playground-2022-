//
//  SoundManager.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 21/04/22.
//

import AVFoundation
import SwiftUI

class SoundManager: NSObject, AVAudioPlayerDelegate, ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    @Published var finishedPlaying: Bool = false
    
    func MusicPlayer(sound: String, type: String) {
        let path = Bundle.main.path(forResource: sound, ofType: type)!
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Erro ao carregar audio!")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        finishedPlaying = true
        print("Acaboooou!")
    }
}
