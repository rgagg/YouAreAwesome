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
  
  @State private var messageString: String = ""
  @State private var messageIndex: Int = 0
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
      
      VStack() {
        
        Image(imageName)
          .resizable()
          .scaledToFit()
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .shadow(color: .gray, radius: 10, x: 10, y: 10)
        
        Spacer()
        
        Text(messageString)
          .font(.largeTitle)
          .multilineTextAlignment(.center)
          .foregroundStyle(.red)
          .fontWeight(.heavy)
        
        Spacer()
        
        Button {
          messageString = (message.randomElement() ?? "")
          
          imageName = "image\(Int.random(in: 0...9))"
          
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
