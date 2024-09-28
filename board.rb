class Board
  def initialize
    @grid = Array.new(3) {Array.new(3, " ")}
  end

  def display
    @grid.each do |row|
      puts row.join(" | ")
    end
  end

  def valid_move?(row, col)
    @grid[row][col] == ' '
  end

  def update_board(row, col, marker)
    # Logic to update the board with the player's move
    @grid[row][col] = marker
  end

  def win?
    # Logic to check for win conditions
    count = 0
    @grid.each do |x|
      if x[0] == x[1] && x[1] == x[2] && x[0] != ' '
        count += 1
      end
    end
    @grid.transpose.each do |x|
      if x[0] == x[1] && x[1] == x[2] && x[0] != ' '
        count += 1
      end
    end
    if (@grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] && @grid[0][0] != ' ') ||
       (@grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2] && @grid[2][0] != ' ')
      count += 1
    end
    count >= 1
  end
end