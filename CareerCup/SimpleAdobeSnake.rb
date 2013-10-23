=begin
You are given a grid of numbers. A snake sequence is made up of adjacent numbers such that for each number, the number on the right or the number below it is +1 or -1 its value. For example, 

 1   3   2   6   8 
-9   7   1  -1   2 
 1   5   0   1   9 

In this grid, (3, 2, 1, 0, 1) is a snake sequence. 

Given a grid, find the longest snake sequences and their lengths (so there can be multiple snake sequences with the maximum length).
=end

grid = [
  [3, 1, 5, 6, 4, 3],
  [2, 1, 1, 2, 5, 2],
  [5, 2, 4, 3, 4, 7],
  [8, 3, 4, 8, 5, 6],
  [5, 4, 8, 9, 4, 7],
  [2, 5, 6, 7, 8, 5],
  [4, 6, 3, 2, 9, 1],
]

def check(x, y, grid, n)
  v = grid[x][y]
  puts "#{n}\t*#{x}, #{y}: [#{v}]"
  i, j = 0

  #check below
  if x+1 < grid.length
    if v+1 == grid[x+1][y] or v-1 == grid[x+1][y]
      i = check(x+1, y, grid, n+1)
    end
  end

  #check to the right
  if y+1 < grid.length
    if v+1 == grid[x][y+1] or v-1 == grid[x][y+1]
      j = check(x, y+1, grid, n+1)
    end
  end

end



grid.each do |row|
  print "#{row}\n"
end

cRow = 0
cCol = 0
grid.each do |row|
  puts "cRow: #{cRow} | #{grid[cRow]}"
  cCol = 0

  grid[cRow].each do |col|
    puts "cCol: #{cCol} | [#{grid[cRow][cCol]}]"

    puts "CHECK:"
    check(cRow, cCol, grid, 0)
    puts "\n"

    cCol += 1
  end

  cRow += 1
end
