require 'bundler/setup'


Bundler.require

require 'active_record'
require 'sinatra/activerecord/rake'
require 'time'
require 'require_all'

require_all 'app'


ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'db/library.db')

