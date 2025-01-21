//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var imageName: String = ""
  @State private var imageNumber: Int = 0
  @State private var lastImageNumber: Int = -1
  @State private var soundName: String = ""
  @State private var soundNumber: Int = 0
  @State private var lastSoundNumber: Int = -1
  @State private var audioPlayer: AVAudioPlayer!
  @State private var soundIsOn: Bool = true
  
  @State private var messageString: String = ""
  @State private var lastMessageIndex: Int = -1
  
  @State private var message: [String] = [
    "You Are Awesome!",
    "You Are Great!",
    "You Are Amazing!",
    "You Are Incredible!",
    "You Coding Genius!",
    "You Are Amazing at Everything!"
  ]
  
  var screenHeight: CGFloat { UIScreen.main.bounds.height }
  var screenWidth: CGFloat { UIScreen.main.bounds.width }
  
  var body: some View {
    
    ZStack {
      LinearGradient(colors: [.blue, .clear],
                     startPoint: .top,
                     endPoint: .bottom)
      .ignoresSafeArea()
      
      VStack() {
        Group {
          Text(messageString)
            .font(.largeTitle)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .fontWeight(.heavy)
            .shadow(color: .black, radius: 10, x: 10, y: 10)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
          
          Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 20, x: 20, y: 20)
            .padding()
        }
        .animation(.easeInOut(duration: 0.3), value: messageString)


        Spacer()
        
        HStack {
          Text("Sound On: ")
          Toggle("Sound On:", isOn: $soundIsOn)
            .labelsHidden()
            .onChange(of: soundIsOn) {
              if audioPlayer != nil && audioPlayer.isPlaying {
                audioPlayer.stop()
              }
            }
          
          Spacer()
          
          Button {
            lastMessageIndex = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: (message.count - 1))
            messageString = (message[lastMessageIndex])
            
            lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber,  upperBounds: 9)
            imageName = "image\(lastImageNumber)"
            
            lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: 4)
            if soundIsOn == true {
              playSound(soundName: "sound\(lastSoundNumber)")
            }
           
          } label: {
            Text("Click Me!")
          }
          .buttonStyle(.borderedProminent)
          .font(.title2)
        }
        
      }
      .padding()
    }
  }
  
  func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
    var newNumber = 0
    
    repeat {
      newNumber = Int.random(in: 0...upperBounds)
    } while lastNumber == newNumber
    return newNumber
  }
  
  func playSound(soundName: String) {
    
    guard let soundFile = NSDataAsset(name: soundName) else
    {
      print("🤬 Could not read file named \(soundName)")
      return
    }
    
    do {
      audioPlayer = try AVAudioPlayer(data: soundFile.data)
      audioPlayer.play()
    } catch {
      print("🤬 ERROR: \(error.localizedDescription) creating audioPlayer")
    }
  }
}

#Preview {
  ContentView()
}
