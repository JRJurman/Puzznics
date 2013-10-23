=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  What is the 10 001st prime number?
=end


def prime?(val)
  s = (val**0.5).to_i
  (2..s).each do |x|
    if val%x == 0
      return false
    end
  end
  return true
end

def nth_prime(n)
  primes = []
  counter = 2
  while primes.length < n
    primes += [[], [counter]][prime?(counter) ? 1 : 0 ]
    counter += 1
  end
  return primes[-1]
end


puts nth_prime(6)
puts nth_prime(10001)
