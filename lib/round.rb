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
    def percent_correct
        correct = @turns.count {|turn| turn.correct?}
        ((correct.to_f/@turns.count.to_f)*100).round(1)
    end
    def percent_correct_by_category(category)
        category_total = @turns.count {|turn| turn.card.category == category}
        ((number_correct_by_category(category).to_f/category_total.to_f)*100).round(1)
    end
    def start
        puts "Welcome! You're playing with #{@deck.count} cards."
        puts "-------------------------------------------------"
        @deck.cards.each do |card|
        puts "This is card number #{@deck.cards.index(current_card)+1} out of #{@deck.count}"
        puts "Question: #{current_card.question}"
        guess = gets
        turn = take_turn(guess.chomp)
        puts turn.feedback
        end

    end
end