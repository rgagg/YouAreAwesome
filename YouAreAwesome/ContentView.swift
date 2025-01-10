//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  //  @State private var messageString = "I'm a programer!"
  @State private var messageString = "When the genius bar needs help, they call you!"
  var screenHeight: CGFloat { UIScreen.main.bounds.height }
  var screenWidth: CGFloat { UIScreen.main.bounds.width }
  
  var body: some View {
    
    ZStack {
      
      VStack() {
        
        Spacer()
        
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .foregroundStyle(.orange)
          .frame(width: 200, height: 200)
        
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
        
        HStack {
          Button {
            messageString = "Awesome!"
          } label: {
            Text("Awesome")
          }
          
          Spacer()
          
          Button {
            messageString = "Great!"
          } label: {
            Text("Great")
          }
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
