class CardGenerator
    attr_reader :cards
    def initialize(filename)
        @cards = []
    end
    # def generate(filename)
    #     cards = []
    #     file.open(filename).each do |line|
    #         line = line.to_s
    #         new_card = /(?<question>\w+)\,(?<answer>\w+)\,(?<category>\w+)/
    #         require 'pry'; binding.pry
    #     end
    # end
end