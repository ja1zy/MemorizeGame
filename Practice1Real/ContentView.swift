//
//  ContentView.swift
//  Practice1Real
//
//  Created by Jasdeep saran on 2022-03-13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var  viewModel: EmojiMemoryGame
    
    
    /*
     this is the program
     everying in the program is here
     we connect the view, view mode, and model in this struct
     */
    var body: some View {
        //the v stack contains all the code!!!!
        VStack{
            
            themeName(name: viewModel.themeName(), color: viewModel.themeColor())
            ScrollView{ //scroll view lets us scrol
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //the grid
                    ForEach(viewModel.cards){
                        card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture  {
                                viewModel.choose(card)
                                //viewModel.resetCards()
                                }
                    }

                    }
            }
            
            
            
            
            .foregroundColor(returnColor(color: viewModel.themeColor()))
            .padding(.horizontal)
            
            Text("Score:  \(viewModel.scoreOfGame())")
                .foregroundColor(returnColor(color: viewModel.themeColor()))
            
            Button{
                viewModel.newGame()
            }label: {
                Text("New Game")
                    .foregroundColor(returnColor(color: viewModel.themeColor()))
            }
            
        }
    }

}
    /*
     this is the view of the card.
     the card's look is decided by this.
     */
struct CardView: View{
    
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
               
            }else if card.isMatched {
                //this command makes the matching cards disappear. 
                shape.opacity(0)
            }
            
            
            else{
                shape.fill()
            }
        }
    }
    
}


/*
this function returns a color for the string color */

func returnColor(color: String) -> Color {
    switch color{
        
    case "red":
        return .red
    case "blue":
        return .blue
    case "orange":
        return .orange
    case "green":
        return .green
    default:
        return .black
    }
}








/*
 this is the name of the struct
 that helps us
 */
struct themeName: View{
    let name: String
    let color: String
    
    var body: some View{
        ZStack{
            Text(name)
                .foregroundColor(returnColor(color: color))
        }
    }
}





        /*
         preview of the content that we are seeing
         */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
      
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
