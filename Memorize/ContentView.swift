//
//  ContentView.swift
//  Memorize
//
//  Created by Ellen Lee on 2024/3/26.
//

import SwiftUI

struct ContentView: View {
    @State var CardCount = 2
    let emojis = ["🥰","😍","☹️","🥳","😱","🫡"]
    var body: some View {
        
        VStack{
            HStack{
                cardRemover
                Spacer()
                cardAdder
            }
            .font(.largeTitle)
            Spacer()
            HStack{
                ScrollView{
                    cardList
                }
            }

        }.padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            CardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(CardCount + offset < 1 || CardCount + offset > emojis.count)
    }
    
    var cardList: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:175))]){
            ForEach(0..<CardCount,id:\.self){index in CardView(content: emojis[index])
                    .aspectRatio(16/9, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "plus")
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "minus")
    }
}



struct CardView: View {
    var content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
