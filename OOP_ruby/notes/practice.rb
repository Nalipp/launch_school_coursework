# Block Examples

# [1,2,3].each { |x| puts x*2 }   # block is in between the curly braces
#
# [1,2,3].each do |x|
#   puts x*2                    # block is everything between the do and end
# end

# Proc Examples
# numbers = Proc.new { |x| puts x*2 }
# [1,2,3].each(&numbers)              # The '&' tells ruby to turn the proc into a block
#
# proc = Proc.new { puts "Hello World" }
# proc.call                     # The body of the Proc object gets executed when called

# Lambda Examples
# lam = lambda { |x| puts x*2 }
# [1,2,3].each(&lam)

# lam = lambda { puts "Hello World" }
# lam.call

# def multiple_procs(proc1, proc2)
#   proc1.call
#   proc2.call
# end
#
# a = Proc.new { puts "First proc" }
# b = Proc.new { puts "Second proc" }
#
# multiple_procs(a,b)

# procx = Proc.new
# procx = { |num| puts num }

# [1, 2, 3].each()

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
compare('hello') { |word| word.upcase }
