require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

# DB[:customers].insert(name: 'John Doe', payment_token: 'EYODHLCN')
# DB[:customers_services].insert(customer_id: 7, service_id: 1)
# DB[:customers_services].insert(customer_id: 7, service_id: 2)
# DB[:customers_services].insert(customer_id: 7, service_id: 3)

DB[:customers_services].each { |row| puts row }
