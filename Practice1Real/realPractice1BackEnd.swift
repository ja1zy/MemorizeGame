//
//  realPractice1BackEnd.swift
//  Practice1Real
//
//  Created by Jasdeep saran on 2022-03-14.
//

import Foundation


//this is the model of the program.


/*
 model
 */

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set)var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    func returnCardUpIndex() -> Int? {
        return indexOfTheOneAndOnlyFaceUpCard
    }
    
    
    //entire logic of playing the game
    //choose is the whole logic
    
    mutating func choose(_ card: Card){
        
        //because the func index returns a Int?, an optional
        //that mean we have to unwrap the func.
        //! will cause crash while if let will return nil
       
        //$0.id== cards.id means that $0 keeps checking array
        //until $0==card. and if we dont find it,
        //then we do nothing
        
        /*
         look at this all day tomorrow !!!!!
         */
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id})
                                                    //goes through all card ids
            , !cards[chosenIndex].isFaceUp
                    //function only works when card is face down!
            , !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
         //card is a struct so we cant make a copy and change it
        cards[chosenIndex].isFaceUp.toggle()
         
        }
        print("\(cards )")
        
    }
    
    /*
    $0.id==card.id replaces this function
     //this func returns the index of the card
    //Int? means that we can return
    func index(of card: Card) -> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil // bogus because we will return first card when
        //we find something
    }
     */
    init(numberOfPairOfCard: Int, createCardContent:(Int) -> CardContent){
        cards = Array<Card>()
        //adds *2 cards
        for pairIndex in 0..<numberOfPairOfCard{
            let content = createCardContent(pairIndex)
            
            
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
            
        }
        cards.shuffle() //shuffles the cards after creating 2 pairs of each
    }
    //cardcontent is a generic
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }

    mutating func resetCards(){
        for index in cards.indices{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        print("\(cards )")
        print("success")
    }
}

struct Theme{
   
    var name: String
    var emojis: [String]
    var pairs: Int
    var color: String
    
    init(name: String, emojis: Array<String>, pairs: Int, color: String){
        self.name = name
        self.emojis = emojis
        self.pairs = pairs
        self.color = color
        
    }

}



 
