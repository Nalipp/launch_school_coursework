require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB[:customers].select(%i(customers__id name payment_token))
              .left_join(:customers_services, customer_id: :id)
              .where(service_id: nil)
              .each { |row| puts row[:row] }
