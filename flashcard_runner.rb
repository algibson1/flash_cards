require './lib/deck'
require './lib/turn'
require "./lib/card"
require "./lib/round"
require "./lib/card_generator"

# card1 = Card.new("What is the capital of Delaware?", "Dover", :Geography)
# card2 = Card.new("What Mountain Range runs through Colorado?", "The Rocky Mountains", :Geography)
# card3 = Card.new("What is the name of the closest star to our Sun?", "Proxima Centauri", :STEM)
# card4 = Card.new("Which planet spins sideways?", "Uranus", :STEM)
# card5 = Card.new("Which planet is home to the Galilean Moons?", "Jupiter", :STEM)
# card6 = Card.new("What is the world's largest flower?", "Rafflesia", :STEM)
# card7 = Card.new("On what date was the current American flag adopted?", "July 4th, 1960", :History)
# card8 = Card.new("Who was the only president (so far) to have never married?", "James Buchanan", :History)
# card9 = Card.new("Who added the months of July and August to the calendar?", "Julius Ceaser", :History)
# card10 = Card.new("What is the world's tallest tree?", "California Redwood", :STEM)
# card11 = Card.new("What is the fastest growing plant?", "Bamboo", :STEM)

# cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11]
filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start