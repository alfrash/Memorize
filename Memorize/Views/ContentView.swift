//
//  ContentView.swift
//  Memorize
//
//  Created by ahmed alfrash on 22/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emojis  = ["🤡", "🦇", "😷", "🧟‍♂️", "🤧", "☃️", "🌩", "🥷", "🧟‍♀️", "🧙🏻", "🦸‍♀️", "🦹🏻‍♀️", "👺", "💩", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃", "🐶", "🐱", "🐭"]
    @State private var emojiCount = 4
    
    var body: some View {
        VStack() {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: true)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(alignment: .center){
                remove
                Spacer()
                shuffle
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding()
            
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
            
        }
    }
    var shuffle: some View {
        Button {
            emojis.shuffle()
        } label: {
            Text("shuffle")
            
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
            
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            if isFaceUp{
                shape
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3.0)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
