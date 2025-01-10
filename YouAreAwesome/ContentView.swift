//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  //  @State private var messageString = "I'm a programer!"
  @State private var messageString = ""
  @State private var imageName: String = ""
  
  var screenHeight: CGFloat { UIScreen.main.bounds.height }
  var screenWidth: CGFloat { UIScreen.main.bounds.width }
  
  var body: some View {
    
    ZStack {
      
      VStack() {
        
        Spacer()
        
        Image(systemName: imageName)
          .resizable()
          .scaledToFit()
          .foregroundStyle(.orange)
        //          .frame(width: 200, height: 200)
        
        Text(messageString)
          .font(.largeTitle)
          .fontWeight(.ultraLight)
          .minimumScaleFactor(0.5)
          .multilineTextAlignment(.center)
          .foregroundStyle(.red)
        //        .frame(width: 300, height: 150)
          .frame(height: 150)
          .frame(maxWidth: .infinity)
          .padding()
        
        Spacer()
        
        Button {
          let message1 = "You Are Awesome!"
          let message2 = "You Are Great!"
          let image1 = "sun.max.fill"
          let image2 = "hand.thumbsup"
          
          if messageString == message1 {
            messageString = message2
            imageName = image1
          } else {
            messageString = message1
            imageName = image2
          }
        } label: {
          Text("Press Me!")
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .tint(.orange)
      }
      .padding()
      
    }
  }
}

#Preview {
  ContentView()
}
