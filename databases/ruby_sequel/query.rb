require 'sequel'

DB = Sequel.connect(adapter: "postgres", database: "sequel_single_table")

recipes = DB[:recipes]

def format_money(amount)
  '%.2f' % amount
end

result = recipes.select do
  labor_calc = (prep_time / 60) * 12
  profit_calc = (menu_price - ingredient_cost) - labor_calc
  [item, menu_price, ingredient_cost, labor_calc.as(labor), profit_calc.as('profit')]
end

result.each do |row|
  puts row[:item]
  puts "menu price: $" + format_money(row[:menu_price]).to_s
  puts "ingredient cost: $" + format_money(row[:ingredient_cost]).to_s
  puts "labor: $" + format_money(row[:labor]).to_s
  puts "profit: $" + format_money(row[:profit]).to_s
  puts
end
