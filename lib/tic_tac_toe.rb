class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def current_player
        if turn_count % 2 == 0 
            return "X"
        elsif turn_count % 2 != 0
            return "O"
        end  
    end 

    def draw? 
        if full? && !won?
            return true 
        else 
            return false
        end  
    end 

    def full?
        @board.all? { |space| space == "X" || space == "O" } 
    end 
    
    def input_to_index(input)
        input_integer = input.to_i
        index_integer = input_integer - 1
        index_integer
    end
    
    def move(index, token = "X")
        @board[index] = token 
    end

    def over?
        if draw? || won?
            return true 
        else 
            return false 
        end 
    end 

    def play 

        until over? == true 
            turn 
        end 

        if won?  
            puts "Congratulations #{winner}!"
        elsif draw?  
            puts "Cat's Game!"
        end    

    end 

    def position_taken?(index)
        if @board[index] != " "
            return true  
        elsif @board[index] == " "
            return false
        end 
    end

    def turn 
        
        puts "Please enter 1-9:"
        input = gets.strip
        
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end 


    end 
    
    def turn_count
        counter = 0
        
        @board.each do |space|
            if space == "X" || space == "O"
                counter += 1
            end 
        end 

        return counter 
    end 

    def valid_move?(index)
        if index.between?(0,8) && @board[index] == " "
            return true 
        else
            return false 
        end 
    end
    
    def winner
        if won? == false
            return nil 
        elsif @board[won?[0]] == "X"
            return "X"
        elsif @board[won?[0]] == "O"
            return "O"
        end           
    end 

    def won?

        WIN_COMBINATIONS.any? do |win_combo|
            if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
                return win_combo  
            end  
        end 

    end

end 