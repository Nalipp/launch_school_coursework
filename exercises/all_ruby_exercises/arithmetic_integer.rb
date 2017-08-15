print "Enter the first number: "
first_number = gets.chomp.to_f
print "Enter the second number: "
second_number = gets.chomp.to_f

def prompt(message)
  puts "==> #{message}"
end

prompt "#{first_number} + #{second_number} = #{first_number + second_number}"
prompt "#{first_number} - #{second_number} = #{first_number - second_number}"
prompt "#{first_number} * #{second_number} = #{first_number * second_number}"
prompt "#{first_number} / #{second_number} = #{first_number / second_number}"
prompt "#{first_number} % #{second_number} = #{first_number % second_number}"
prompt "#{first_number} ** #{second_number} = #{first_number ** second_number}"
