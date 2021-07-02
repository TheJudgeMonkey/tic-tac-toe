require_relative 'board.rb'
require_relative 'player.rb'

class Game
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [6, 4, 2],
        [0, 4, 8]
    ]

    def initialize
        @player = Player.new
    end

    def play
        @game_over = false 
        @gameboard = Board.new
        switch_players
    end

    def switch_players
        @count = 1
        while @count<10 
            if @count % 2 != 0
                turn(@player.player_x, "X")
            elsif @count % 2 == 0
                turn(@player.player_o, "O")
            end
        end
    end

    def turn (player, symbol)
        if @game_over == false
            puts " "
            puts "Choose a position #{player}(#{symbol})" 
            puts"1|2|3"
            puts"-+-+-"
            puts"4|5|6"
            puts"-+-+-"
            puts"7|8|9"
            puts " "
            @player_play = gets.chomp.to_i - 1
            puts " "
            if ((@player_play.between? 0, 8) && (@gameboard.board[@player_play] == "*"))
                @count +=1
                @gameboard.board_update(@player_play, symbol)
                win_check
                draw_check
            else
                puts "Invalid position, please choose empty position from 1 to 9"
            end
        end    
    end
   
    def win_check
        if combo == true 
            who_won
            @game_over = true
            @count = 10
        else 
            @game_over = false
        end
    end

    def combo
        WIN_COMBINATIONS.each do |combo|
            if((@gameboard.board[combo[0]] == @gameboard.board[combo[1]] && 
            @gameboard.board[combo[1]] == @gameboard.board[combo[2]]) &&
            @gameboard.board[combo[0]] != "*")
            return true
            end
        end
    end

    def who_won
        count_x = @gameboard.board.count{ |e| e == "X" }
        count_o = @gameboard.board.count{ |e| e == "O" }
        if count_x > count_o
            puts " "
            puts "#{@player.player_x} WINS! Congratulations!"
            puts " "
        else 
            puts " "
            puts "#{@player.player_o} WINS! Congratulations!"
            puts " "
        end
    end

    def draw_check
        if @count== 10 && @game_over == false
            puts "It's a draw"
        end
    end
end




