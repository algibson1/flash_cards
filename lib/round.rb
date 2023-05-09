class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
    end
    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        turn
    end
    def current_card
        @deck.cards[@turns.count]
    end
    def number_correct
        @turns.count {|turn| turn.correct? == true}
    end
    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end
end