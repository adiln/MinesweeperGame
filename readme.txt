The player is initially presented with a grid of undifferentiated squares(cross mark). Some randomly selected squares,
unknown to the player, are designated to contain mines. Typically, the size of the grid and the number of mines are set
in advance by the user, by entering the numbers. The game is played by revealing squares of the grid by indicating each
square, giving input in the format o(1,2) where "o" means option and 1 and 2 representing square position(row 1, column 2).
If a square containing a mine is revealed, the player loses the game. If no mine is revealed, a digit(0) is instead
displayed in the square. The game is won when all mine-free squares are revealed, because all mines have been located.

Example:
 ## m denotes mine, layout can by of any size, player can input 2*2, 3*3, 4*4 grids etc
 ## inputs in small case

 Enter minefield layout...
 xmx,xxm,xxx

 Enter option...
 o(0,0)

 0xx
 xxx
 xxx

 Enter option...
  o(2,0)

  0xx
  xxx
  0xx

  Enter option...
   o(0,1)
  #Oops, you stepped on a mine! Game Over!






To run in console, please type

$ruby minesweeper.rb