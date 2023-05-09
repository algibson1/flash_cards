require "./lib/card"
require "./lib/card_generator"

RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        cards = CardGenerator.new(filename)
        expect(cards).to be_an_instance_of(CardGenerator)
    end

    it 'creates cards from file' do
        card1 = Card.new("What is the capital of Delaware?","Dover",:Geography)
        filename = "cards.txt"
        cards = CardGenerator.new(filename).cards
        expect(cards.first.answer).to eq(card1.answer)
    end
end