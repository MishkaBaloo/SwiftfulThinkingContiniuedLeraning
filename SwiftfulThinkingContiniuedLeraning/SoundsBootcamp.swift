//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 11.05.2024.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager() //Singleton 
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play first sound") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play second sound") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
