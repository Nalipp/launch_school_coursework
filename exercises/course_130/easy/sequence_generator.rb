def step(min, max, step, &block)
  current_value = min
  loop do
    yield(current_value)
    break if current_value >= max
    current_value += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10
