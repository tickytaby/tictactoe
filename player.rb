class Player
  attr_reader :name, :marker

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
  end

  def pick(row, col)
    # Logic to pick a move, ensure valid pick on board
    if @board.valid_move?(row, col)
      @board.update_board(row, col, @marker)
    else 
      puts "Invalid move, please try again"
    end
  end
end