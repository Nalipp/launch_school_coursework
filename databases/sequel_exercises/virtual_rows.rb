require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

puts DB[:customers].select(:name, :price)
                   .join(:customers_services, customer_id: :id)
                   .join(:services, id: :service_id).distinct
                   .where { price >= 15 }
                   .limit(3)
                   .map { |line| line[:name].split.reverse.join(', ') }.sort
