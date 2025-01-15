//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var imageName: String = ""
  @State private var imageNumber: Int = 0
  @State private var lastImageNumber: Int = -1
  
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
        
        Spacer()
        
        Button {
          var messageIndex: Int
          var imageNumber: Int
          
          repeat {
            messageIndex = Int.random(in: 0...message.count - 1)
          } while messageIndex == lastMessageIndex
          
          repeat {
            imageNumber = Int.random(in: 0...9)
          } while imageNumber == lastImageNumber
          
          lastMessageIndex = messageIndex
          lastImageNumber = imageNumber
          
          messageString = (message[messageIndex])
          imageName = "image\(imageNumber)"
          
        } label: {
          Text("Click Me!")
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
      }
      .padding()
      
    }
  }
}

#Preview {
  ContentView()
}
