//
//  EmojiMemoryGame.swift
//  Practice1Real
//
//  Created by Jasdeep saran on 2022-03-14.
//

//this is the view model/ the thing that connect the model to the view
//this a part of the UI
//view model will be a class


import SwiftUI



/*
 view model
 */


//this class is

class EmojiMemoryGame: ObservableObject {
    private var checkSlots: [Bool]
    
    private var score: Int
    private var theme: Theme
    //this is the view model
    @Published private var model: MemoryGame<String> = createMemoryGame (pairs: 5, theme: chooseTheme())
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    static var themes: [Theme] =  createThemes()
    /*
     this is the card tracking game!
     
    struct scoreOfOne{
        var currentScore: Int
        var completedStatus: Bool
    }
    func scoreOfALL() -> [scoreOfOne]{
        var array = [scoreOfOne]
        for index in 0..<cards.count {
            array.append(scoreOfOne(currentScore: 0, completedStatus: false))
        }
    }
    */
    
    init(){
        score = 0
        theme = EmojiMemoryGame.themes.randomElement()! //chooses random theme
        theme.emojis.shuffle() //shuffles cards
        model = EmojiMemoryGame.createMemoryGame(pairs: 5, theme: self.theme)
        checkSlots = Array(repeating: false, count:12)
    }
    

    

    
    
    
    
    
    
    func scoreOfGame()  -> Int{
        return score
    }
    
    
    
    
    
    
    
    
    
    func themeName() -> String{
        theme.name
    }
    
    static let emojis = ["😀","🤪", "🧐","😱","🥱","🙄","😢","🙀","🥸","🥳","🤡"]
    //model creates a emoji memory game !!!!!!
    //the func is right above this.
    /*
     static let Halloween = ["🎃","👻", "🐈‍⬛","💀", "🧟","🌚","🦹🏻"]
     static let Sports = ["🏀","🏈", "⚾️","🎾", "🏐", "🏉", "🏏", "🏒", "🥊","🏓", "⚽️"]     //in realpractice1backEnd
     init(numberOfPairOfCard: Int, createCardContent:(Int) -> CardContent){
         cards = Array<Card>()
         //adds *2 cards
         for pairIndex in 0..<numberOfPairOfCard{
             let content = createCardContent(pairIndex)
             cards.append(Card(content: content))
             cards.append(Card(content: content))        }
     
     }
 */
   
    static func createMemoryGame(pairs: Int, theme: Theme) -> MemoryGame<String>{
        
        var realPairs = pairs
        if pairs >= theme.emojis.count{
            realPairs = theme.emojis.count-1
        }
        
        return MemoryGame<String>(numberOfPairOfCard: realPairs){ pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    
    
    
    //new one
    /*
    static func createMemoryGame(pairs: Int) -> MemoryGame<String>{
         MemoryGame<String>(numberOfPairOfCard: pairs){ pairIndex in
             self.chooseTheme().emojis[pairIndex]
        }
    }
    */
   
/* old
 static func createMemoryGame(pairs: Int) -> MemoryGame<String>{
      MemoryGame<String>(numberOfPairOfCard: pairs){ pairIndex in
         EmojiMemoryGame.emojis[pairIndex]
     }
 }

 @Published updates the program and tells the program that the world has changed
 it tells the world that the vr has changed
 */
   

    func choose(_ card: MemoryGame<String>.Card){
        //this command tells program that the program has changed and we need to
        //update something in our program to make sure we good.
        //this is not needed as we have key word published at the top for this
        //objectWillChange.send()
        //this command lets us choose card
        if let numb = model.returnCardUpIndex(){
            model.choose(card)
            if cards[numb].isMatched == false && checkSlots[numb]==true{
                score = score - 1
            }else if cards[numb].isMatched == true{
                score = score + 2
            }
            checkSlots[numb] = true
            
        } else{
        
        model.choose(card)
    
        }
        print(score)
    }
    
    func resetCards(){
        model.resetCards()
    }
    
    func themeColor() ->  String{
        return theme.color
    }
    
    
    
    
            /*      bonus game stuff: add a theme   */
    //The emojis
    static let halloween = ["👻","💀","😈","🧛🏻","🧟‍♂️","🧞‍♂️"]
    static let christmas = ["🎅🏻","🎄", "🤶","☃️"]
    static let sports = ["⚽️","🏀","⚾️","🏈","🥎","🎾","🏐","🏉"]
    
    
    static let christmasTheme: Theme = Theme(name: "halloween", emojis: halloween, pairs: halloween.count, color: "orange")
    static let halloweenTheme: Theme =  Theme(name: "christmas", emojis: christmas, pairs: christmas.count, color: "red")
    static let sportsTheme: Theme = Theme(name: "sports", emojis: sports, pairs: sports.count, color: "yellow")
    
     static func createThemes() -> [Theme]{
         [EmojiMemoryGame.christmasTheme, EmojiMemoryGame.halloweenTheme, EmojiMemoryGame.sportsTheme]
    }
    
     
    
      static func chooseTheme()-> Theme {
         let number = Int.random(in: 0..<EmojiMemoryGame.createThemes().count)
         return createThemes()[number]
    }

    func newGame(){
        score = 0
        theme = EmojiMemoryGame.themes.randomElement()! //chooses random theme
        theme.emojis.shuffle() //shuffles cards
        model = EmojiMemoryGame.createMemoryGame(pairs: 5, theme: self.theme)
        checkSlots = Array(repeating: false, count: 12)
    }
    

}
