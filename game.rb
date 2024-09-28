class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X", @board)
    @player2 = Player.new("Player 2", "O", @board)
  end
  
  def get_move(player)
    puts "#{player}, It's your turn to play! Insert your move in row,col format"
    player_move = gets.chomp.split(',')
    player_move.map {|x| x.to_i}
  end

  def play
    # Logic to manage game flow, alternating turns, checking win or draw
    player_one = "Player 1"
    player_two = "Player 2"
    i = 1
    while i <= 9 
      @board.display
      if i % 2 != 0
        move = get_move(player_one)
        row, col = move 
        if !@board.valid_move?(row,col)
          i -= 1
        end
        @player1.pick(row,col)
        if @board.win?
          @board.display
          puts "#{player_one} wins!"
          break
        end
      else
        move = get_move(player_two)
        row, col = move
        if !@board.valid_move?(row,col)
          i -= 1
        end
        @player2.pick(row,col)
        if @board.win?
          @board.display
          puts "#{player_two} wins!"
          break
        end
      end
      i += 1
    end
    if i > 9 && !@board.win?
      puts "Tie game!"
    end
  end
end