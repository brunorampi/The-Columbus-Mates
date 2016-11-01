require 'active_record'

options= {
  adapter: 'postgresql',
  database: 'columbusmates',
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
