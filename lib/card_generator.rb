class CardGenerator
    attr_reader :cards
    def initialize(filename)
        @cards = generate(filename)
    end
    def generate(filename)
        cards = []
        File.open("./lib/#{filename}").each do |line|
            line = line.to_s
            new_card = line.match /(?<question>.+)\,(?<answer>.+)\,(?<category>.+)/
            cards.push(Card.new(new_card[:question], new_card[:answer], new_card[:category]))
        end
        cards
    end
end