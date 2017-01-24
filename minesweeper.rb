class Minefield
  attr_accessor :field, :field_with_mines
  def initialize rows, columns
    #creating 2D array
    @field, @field_with_mines = Array.new(rows){Array.new(columns, 'x')},
        Array.new(rows){Array.new(columns, 'x')}
  end

  #placing mines on specified cells
  def create_mine_field layout
    layout.each_with_index  do|row, i|
      position_m = row.index('m')
      @field_with_mines[i][position_m] = "m" if position_m
    end
  end

  # call this method to view the layout/field
  def view_field field
    field.each do|row|
      row.each {|column| print column}
      print "\n"
    end
  end

  #check if player win
  def check_win
    num_of_mines = @field_with_mines.flatten.count("m")
    num_of_cells = @field.flatten.count
    num_of_0 = @field.flatten.count("0")
    num_of_f = @field.flatten.count("f")
    if((num_of_0 + num_of_f + num_of_mines) == num_of_cells)
      puts "You won!"
      exit
    end
  end

  #locating cells
  def open_location position
    cordinate = position.to_s.scan(/\d+/)
    i, j = cordinate[0].to_i,  cordinate[1].to_i #get cell position
    if @field_with_mines[i][j] == "m"
      puts "Oops, you stepped on a mine! Game Over!"
      exit
    end
    @field[i][j] = "0" if (position.to_s)[2] == "o" && @field[i][j] != "f" # locate
    @field[i][j] = "f" if (position.to_s)[2] == "f" #mark
    check_win
    view_field @field
  end
end

class Game
  def get_layout_size input_layout
    [input_layout.size, input_layout[0].size]
  end
  def play
    puts " Enter minefield layout..."
    input_layout = gets.chomp.split(',')
    rows, columns = get_layout_size input_layout
    puts "--------------------------"
    minefield = Minefield.new(rows, columns)
    minefield.create_mine_field(input_layout)
    minefield.view_field(minefield.field)
    loop do
      puts "Enter option..."
      position = gets.chomp.split(',')
      puts "--------------------------"
      minelayout.open_location(position)
    end
  end
end
Game.new.play

