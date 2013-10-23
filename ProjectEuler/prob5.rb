=begin
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=end

goal = 0

def condition(val)
  check = 0
  (1..20).each do |x|
    check += val%x
  end
  if check == 0 and val > 0
    puts val
    return val
  end
end


while( not condition( goal ) )
  #add the multiplication of all prime numbers
  goal += (1*3*5*7*13*17*19)
end
