//
//  ContentView.swift
//  new_test
//
//  Created by Mayank Kumar on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["⚽️","🏀","🏈","⚾️","🥎","🏐","🎱","🏉","🎾"]
    @State var count=2
    var body: some View {
        VStack{
            text_in_view()
            HStack{
                ForEach(emojis[0..<count], id: \.self){
                    emoji in partsview(content : emoji)
                }
                
            }
            HStack{
                Button{
                    if count < emojis.count{
                        count+=1
                    }
                }
                label:{
                    Image(systemName: "plus.circle")
                        .foregroundColor(.blue)
                        .fontWeight(.bold).font(.largeTitle)
                }
                Spacer()
                Text("Shuffle").font(.largeTitle).fontWeight(.bold)
                Spacer()
                
                Button{
                    if count > 2
                    {
                        count-=1
                        
                    }
                    
                }
                label:{
                    Image(systemName: "minus.circle")
                        .foregroundColor(.blue)
                        .fontWeight(.bold).font(.largeTitle)
                    }
                    .padding(.horizontal)
            }
        }
        .foregroundColor(.blue)
        .padding()
        
    }
}


struct text_in_view: View{
    var body: some View{
        VStack(content:{
            Text("PLAY THE GAME")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        })
    }
}
struct partsview: View{
    var content : String
    @State var isFaceup: Bool = false
    var body: some View{
        ZStack (content:{
            let shape = RoundedRectangle(cornerRadius: 30.5)
            if isFaceup {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            else{
                shape.fill()
            }
        }).onTapGesture{
            isFaceup = !isFaceup
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
