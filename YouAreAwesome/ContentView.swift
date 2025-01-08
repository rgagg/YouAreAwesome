//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 8/1/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var messageString = ""
  
  var body: some View {
    VStack {
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundStyle(.red)
//        .frame(height: 50)
      
      HStack {
        Button {
          messageString = "You Are Awesom!"
        } label: {
          Text("Awesome!")
        }
        .buttonStyle(.borderedProminent)
        
        Button {
          messageString = "You Are Great!"
        } label: {
          Text("Great!")
        }
        .buttonStyle(.borderedProminent)
      }
      
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
