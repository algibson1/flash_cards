# require "./lib/card"
require "./lib/card_generator"
# require "./lib/cards.txt"

RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        cards = CardGenerator.new(filename)
        expect(cards).to be_an_instance_of(CardGenerator)
    end
end