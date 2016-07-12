def test(&block)
  puts "What's &block? #{block}"
end

p test { sleep(1) }
