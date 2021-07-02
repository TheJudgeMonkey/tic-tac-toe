class Board
    attr_reader :board
          
    def initialize
        @board = Array.new(9,"*")
    end

    def board_update(position, symbol)
        @board[position] = symbol
        display_board(@board)
    end

    def display_board (board)
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "---+---+---"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "---+---+---"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
end