=begin
A palindromic number reads the same both ways. 
The largest palindrome made from the product of 
two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

def palindrome?(str)
  str == str.reverse
end

palys = []

(100..999).each do |x| 
  (100..999).each do |y| 
    if palindrome?((x*y).to_s) 
      palys += [x*y]
    end
  end
end

palys.sort!
puts palys
