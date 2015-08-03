class Sudoku
  attr_reader :board

  def initialize(board_string)
    @board = board_string.split("")
  end

# ITERATIVE
#   def solve
#     while @board.include?("-")
#       @board.each_with_index.map do |cell, index|
#         possibilities = (1..9).to_a
#         present_nums = (box_check(index) + row_check(index) + column_check(index))
#         result = possibilities - present_nums
#         @board[index] = result.first if cell == "-" && (result).length == 1
#       end
#     end
#   end


# RECURSIVE
  def solve
    @board.each_with_index do |cell,index|
      possibilities = (1..9).to_a
      present_nums = (box_check(index) + row_check(index) + column_check(index))
      guesses = possibilities - present_nums
      if cell == "-"
        guesses.each do |guess|
          @board[index] = guess
          return true if solve == true
        end
      else
        next
      end
      @board[index] = "-"
      return false
    end
    return true
  end


  def board
    @board
  end


  def to_s
    @board.each_slice(9).map {|row| row.join(" ")}.join("\n")
  end


  def box_check(index)
    current_box = [((index/9)/3)*3] + [(index % 9)/3]
    present_box = []
    @board.each_with_index {|cell, idx| present_box << cell.to_i if current_box == [((idx/9)/3)*3] + [(idx % 9)/3]}
    present_box
  end


  def row_check(row_index)
    row = (row_index / 9)
    present_row = []
    @board.each_with_index {|cell,index| present_row << cell.to_i if (index / 9) == row}
    present_row
  end


  def column_check(column_index)
    column = (column_index % 9)
    present_col = []
    @board.each_with_index {|cell,index| present_col << cell.to_i if (index % 9) == column}
    present_col
  end

end



# game = Sudoku.new("-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--")
# game.solve
# puts game



