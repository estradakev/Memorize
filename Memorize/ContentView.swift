//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Estrada on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚙","🚀","🚁", "🚘", "🚚", "🛫","🛬","🏎"
                    ,"🏍", "🚐","🚛", "🛩", "🛻"]
    
    @State var emojiCount = 14
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount],id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                //remove btn added here
                remove
                Spacer()
                //add btn added here
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
    //This creates the remove button
    var remove : some View {
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label: {
           Image(systemName: "minus.circle")
        }
    }
    //this creates the add button
    var add : some View {
        Button{
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
        return ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}









struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)

    }
}
