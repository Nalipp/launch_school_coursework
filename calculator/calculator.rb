def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "Welcome to Calculator!, Enter your name:"

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure you provide your name")
  else
    prompt "Welcome #{name}"
    break
  end
end

loop do
  num1 = ''
  loop do
    prompt "What's the first number?"
    num1 = gets.chomp.to_i
    if valid_number?(num1)
      break
    else
      prompt "Hmm... that dosen't look like a valid number"
    end
  end

  num2 = ''
  loop do
    prompt "What's the second number?"
    num2 = gets.chomp.to_i
    if valid_number?(num2)
      break
    else
      prompt "Hmm... that dosen't look like a valid number"
    end
  end

  operator_prompt = <<-MSG
    What operstion would you like to preform?
    1)add
    2)subtract
    3)multiply
    4)divide
  MSG

  prompt operator_prompt
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Please choose 1,2,3 or 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when "1"
             num1 + num2
           when "2"
             num1 - num2
           when "3"
             num1 * num2
           else
             num1.to_f / num2.to_f
           end

  prompt "The answer is #{result}"

  prompt "Do you want to preform another opperation? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end
