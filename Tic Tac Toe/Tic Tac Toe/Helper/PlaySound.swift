/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Dang Truong Nguyen Long
  ID: s3757333
  Created  date: 19/08/2022
  Last modified: 19/08/2022
  Acknowledgement: Mixkit, pixabay, Flaticon
*/

import SwiftUI

import AVFoundation

var soundEffectPlayer: AVAudioPlayer?
var menuMusicPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, volumeScale: Float, audioPlayer: inout AVAudioPlayer?) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(volumeScale, fadeDuration: 0)
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func playSoundLoop(sound: String, type: String, volumeScale: Float, loop: Int, audioPlayer: inout AVAudioPlayer?) {
    // -1 to do infinite loop
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.setVolume(volumeScale, fadeDuration: 0)
            audioPlayer?.numberOfLoops = loop
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
