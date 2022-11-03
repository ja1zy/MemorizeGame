# MemorizeGame
  The App is split into four sections: Realapp, EmojimemoryGame, contentView, backEnd. 

##realApp
  this file simply tells swiftUI to run the app, and the only line of code gives the program 
  to run the contentView, with an instance variable for the viewModel. 
  
##ContentView
  this file is concerned with the layout and the size of the cards.  it also handles the UI, 
  and tells the EmojiMemoryGame about what has changed about the current deck of cards. 
  
  
##EmojiMemoryGame
  This is class and the contentView utalizes 1 instance of this class to make changes to the 
  UI. every change to the program that is comminucated from the user goes to the instance of 
  this class. This class simply encapsulates the backEnd class.
  
##BackEnd
  The back end file simply takes the cards, which is just an array of emojis. It handles 
  all the logic of the program, and the emojiMemory game class is simply a collection of
  structs from this file! 
  
  
  ##new game button 
  clicking the new game button creates a whole new list of cards with different faced emojis,
  which starts from the beginning. 
  
  
  
  
  
