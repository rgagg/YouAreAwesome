//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var messageString = "I'm a programer!"
  
  var body: some View {
    VStack {
      Spacer()
      
      Image(systemName: "swift")
        .resizable()
        .scaledToFit()
        .foregroundStyle(.orange)
        .frame(width: 200, height: 200)
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.ultraLight)
        .foregroundStyle(.red)
      
      Spacer()
      
      HStack {
        Button {
          messageString = "Awesome!"
        } label: {
          Text("Awesome")
        }
        
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

#Preview {
  ContentView()
}
