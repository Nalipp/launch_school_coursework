require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator.yml')

loop do
  def prompt(message)
    puts "=>  #{message}"
  end

  def years_to_months(loan_years)
    loan_years.to_i * 12
  end

  def monthly_interest_rate(annual_rate)
    (annual_rate.to_f * 0.01) / 12
  end

  def monthly_pmt(loan_amt, annual_rate, loan_years)
    i = monthly_interest_rate(annual_rate)
    n = years_to_months(loan_years)
    (loan_amt.to_i * ((i * ((i + 1)**n)) / (((1 + i)**n) - 1))).round(2)
  end

  def valid_number?(num)
    num.to_i.to_s == num && num.to_i >= 0
  end

  def valid_float?(num)
    Float(num) rescue false
  end

  loan_amt = ''
  loop do
    prompt("Enter the initial loan amount?")
    loan_amt = gets.chomp
    if valid_number?(loan_amt)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  annual_rate = ''
  loop do
    prompt("Enter the annual percentage rate")
    annual_rate = gets.chomp
    if valid_float?(annual_rate)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  loan_years = ''
  loop do
    prompt("How many years is the loan")
    loan_years = gets.chomp
    if valid_number?(loan_years)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  puts <<-MSG
    loan amount          : #{loan_amt}
    percentage rate      : #{annual_rate}
    loan term in years   : #{loan_years}
    number of payments   : #{years_to_months(loan_years)}
    monthly mortgage pmt : #{monthly_pmt(loan_amt, annual_rate, loan_years)}
  MSG

  prompt("Would you like to make another calculation? [y/n]")
  request = gets.chomp.downcase
  break if request != "y"
end
