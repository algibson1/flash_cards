require './lib/turn'
require './lib/card'


RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'adds a guess to a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.card).to eq(card)
        expect(turn.guess).to eq("Juneau")
    end

    it 'gives feedback' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to be true
        expect(turn.feedback).to eq("Correct!")
    end

    it 'gives feedback on negative answers' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.card).to eq(card)
        expect(turn.guess).to eq("Saturn")
        expect(turn.correct?).to be false
        expect(turn.feedback).to eq("Incorrect.")
    end
end