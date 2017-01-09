require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

puts DB[:services].select { sum(price).cast(:money) }
                  .join(:customers_services, service_id: :id)
                  .first[:sum]
