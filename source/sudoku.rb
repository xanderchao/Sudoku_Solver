# class Sudoku
#   def initialize(board_string)
#     @board = board_string.split("")
#   end

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

#   def board
#     @board
#   end

#   # Returns a string representing the current state of the board
#   def to_s
#     @board.each_slice(9).map {|row| row.join(" ")}.join("\n")
#   end

#   def box_check(index)
#     current_box = [((index/9)/3)*3] + [(index % 9)/3]
#     present_box = []
#     @board.each_with_index {|cell, idx| present_box << cell.to_i if current_box == [((idx/9)/3)*3] + [(idx % 9)/3]}
#     present_box
#   end

#   def row_check(row_index)
#     row = (row_index / 9)
#     present_row = []
#     @board.each_with_index {|cell,index| present_row << cell.to_i if (index / 9) == row}
#     present_row
#   end

#   def column_check(column_index)
#     column = (column_index % 9)
#     present_col = []
#     @board.each_with_index {|cell,index| present_col << cell.to_i if (index % 9) == column}
#     present_col
#   end
# end



class Sudoku
  def initialize(board_string)
    @board = board_string.split("")
  end

  def solve(array = nil)
    return @board if @board.include?("-") == false
    @board.each_with_index.map do |cell,index|
      possibilities = (1..9).to_a
      present_nums = (box_check(index) + row_check(index) + column_check(index))
      result = possibilities - present_nums
      return if possibilities.empty?
      if cell == "-"
        result.each_with_index do |possible_num, idx|
          # return if box_check(index).include?(possible_num)
          # return if row_check(index).include?(possible_num)
          # return if column_check(index).include?(possible_num)
          @board[index] = possible_num
          solve
        end
      end
    end
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



# game = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
# p game.to_s
# p game.row_check(1)
# p game.column_check(0)
# p game.box_check(0)