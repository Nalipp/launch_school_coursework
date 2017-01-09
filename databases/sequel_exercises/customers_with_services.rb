require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB[:customers].select(%i(customers__id name payment_token))
              .join(:customers_services, customer_id: :id).distinct
              .each { |customer| puts customer[:row] }
