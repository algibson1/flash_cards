require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        expect(round).to be_instance_of(Round)
    end

    it 'has a deck but no turns by default' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        expect(round.deck).to eq(deck)
        expect(round.turns).to eq([])
    end

    it 'Can return a current card and make a guess' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        expect(round.current_card).to eq(card_1)
        new_turn = round.take_turn("Juneau")
        expect(new_turn.class).to eq(Turn)
        expect(new_turn.correct?).to be true
        expect(round.turns).to eq([new_turn])
        expect(round.number_correct).to eq(1)
    end

    it 'can change cards each turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        expect(round.current_card).to eq(card_2)
        round.take_turn("Venus")
        expect(round.turns.count).to eq(2)
        expect(round.turns.last.feedback).to eq("Incorrect.")
        expect(round.current_card).to eq(card_3)
    end

    it 'returns stats on correct answers by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")
        expect(round.number_correct).to eq(1)
        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'calculates percentage correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")
        expect(round.percent_correct).to eq(50.0)
        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(round.current_card).to eq(card_3)
    end

    it 'can give an array of card categories' do
        card1 = Card.new("What is the capital of Delaware?", "Dover", :Geography)
        card2 = Card.new("What Mountain Range runs through Colorado?", "The Rocky Mountains", :Geography)
        card3 = Card.new("What is the name of the closest star to our Sun?", "Proxima Centauri", :STEM)
        card4 = Card.new("Which planet spins sideways?", "Uranus", :STEM)
        card5 = Card.new("Which planet is home to the Galilean Moons?", "Jupiter", :STEM)
        card6 = Card.new("What is the world's largest flower?", "Rafflesia", :STEM)
        card7 = Card.new("On what date was the current American flag adopted?", "July 4th, 1960", :History)
        card8 = Card.new("Who was the only president (so far) to have never married?", "James Buchanan", :History)
        card9 = Card.new("Who added the months of July and August to the calendar?", "Julius Ceaser", :History)
        card10 = Card.new("What is the world's tallest tree?", "California Redwood", :STEM)
        card11 = Card.new("What is the fastest growing plant?", "Bamboo", :STEM)
        cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11]
        deck = Deck.new(cards)
        round = Round.new(deck)
        expect(round.categories).to eq([:Geography, :STEM, :History])
    end

end