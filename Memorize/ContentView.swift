//
//  ContentView.swift
//  Memorize
//
//  Created by Ellen Lee on 2024/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}



struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("😍").font(.largeTitle)
            } else{
                base.fill(.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
