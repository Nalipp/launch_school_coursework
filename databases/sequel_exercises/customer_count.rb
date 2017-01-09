require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

rows = DB[:services].select(:description)
                    .join(:customers_services, service_id: :id)
                    .map { |row| row }

counts = Hash.new(0)
rows.map { |row| row[:description] }.each do |description|
  counts[description] += 1
end

p "#{counts.keys[0]}, #{counts.values[0]}"
p "#{counts.keys[1]}, #{counts.values[1]}"
