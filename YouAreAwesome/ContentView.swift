//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var message = "I am an app developer!"
  
  var body: some View {
    VStack {
      
      Image(systemName: "swift")
        .resizable()
        .scaledToFit()
        .foregroundStyle(.orange)
      
      Text(message)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundStyle(.red)
      
      Button {
        message = "You are awesome!"
      } label: {
        Text("Click Me!")
      }

    }
    .padding()
  }
}

#Preview {
  ContentView()
}
