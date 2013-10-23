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

class SnakeSearch
  attr_accessor :x, :y, :v
  def initialize(x, y, value)
    @x = x
    @y = y
    @v = value
  end

  def check(grid, n)
    puts "#{n}\t*#{@x}, #{@y}: #{grid[@x][@y]}"
    i, j = nil

    #check below
    if @x+1 < grid.length
      if @v+1 == grid[@x+1][@y] or @v-1 == grid[@x+1][@y]
        i = SnakeSearch.new(@x+1, @y, grid[@x+1][@y])
      end
    end

    #check to the right
    if @y+1 < grid.length
      if @v+1 == grid[@x][@y+1] or @v-1 == grid[@x][@y+1]
        j = SnakeSearch.new(@x, @y+1, grid[@x][@y+1])
      end
    end

    iRes = i ? i.check(grid, n+1) : 0
    jRes = j ? j.check(grid, n+1) : 0

    return iRes > jRes ? iRes : jRes

  end
end

grid.each do |row|
  print "#{row}\n"
end

cRow = 0
grid[0].each do |row|
  c = SnakeSearch.new(0, cRow, grid[0][cRow])
  puts "cRow: #{cRow}, check: \n"
  c.check(grid, 0);
  puts "\n\n"
  cRow += 1
end
