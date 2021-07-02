class Player
    attr_reader :player_x, :player_o
    
    def initialize
        puts "First turn for X, please enter your name"
        @player_x = gets.chomp
        puts "Second turn for O, please enter your name"
        @player_o = gets.chomp
    end
end