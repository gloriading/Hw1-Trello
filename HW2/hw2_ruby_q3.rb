# Question 3
# Write a Ruby method called: is_prime. The function must take a number n and it should return true or false whether the argument passed (n) is a prime number or not. A prime number is a number that is divisible only by 1 and itself.
#-----------------------------------------------------------------------
# 1 - check if the number is an Integer before checking if it's a prime
# 2 - looping through 2 to n-1, if some number can be divided by n, counter + 1
# 3 - after the loop, if counter stays 0, it means no number can be divided by n
#     hence n is a prime

def is_prime(n)
  if n.is_a? Integer
    counter = 0
    for i in 2..Math.sqrt(n)
      if n % i == 0
        counter += 1
      end
    end
    if counter == 0
        p true
    else
      p false
    end
  else
    p 'it is not an Integer'
  end
end

is_prime(18)


#Method 2 ---------------------------------------------------------------
#  using (range of numbers).any? {|element| number % element == 0}
#  if there's one number within that range can be divided by i, it's true, print false
def is_prime?(n)
  if n.is_a? Integer
     if (2..Math.sqrt(n)).any?{|i| n % i == 0}
       p false
     else
       p true
     end
  else
    p 'n is not an integer'
  end
end
# is_prime? (6)
