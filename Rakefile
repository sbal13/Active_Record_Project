# task :environment do
#   ENV["ACTIVE_RECORD_ENV"] ||= "development"
#   require_relative './config/environment.rb'
# end
 
# include ActiveRecord::Tasks
# DatabaseTasks.db_dir = 'db'
# DatabaseTasks.migrations_paths = 'db/migrate'
# seed_loader = Class.new do
#   def load_seed
#     load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
#   end
# end

# DatabaseTasks.seed_loader = seed_loader.new
# load 'active_record/railties/databases.rake'

task :environment do
	require_relative './config/environment.rb'
end

 
task console: :environment do

	UserBook.destroy_all
	Author.destroy_all
	Book.destroy_all
	Category.destroy_all
	User.destroy_all


	mura = Author.create(name: "Haruki Murakami")
	kafka = Author.create(name: "Franz Kafka")
	bryson = Author.create(name: "Bill Bryson")
	diamond = Author.create(name: "Jared Diamond")

	mreal = Category.create(name: "magical realism")
	n_fiction = Category.create(name: "non-fiction")

	kots = Book.create(title: "Kafka on the Shore", author: mura, category: mreal)
	meta = Book.create(title: "The Metamorphosis", author: kafka, category: mreal)
	oneq = Book.create(title: "1Q84", author: mura, category: mreal)
	shone = Book.create(title: "A Short History of Nearly Everything", author:bryson, category: n_fiction)
	ggs = Book.create(title: "Guns, Germs, and Steel", author: diamond, category: n_fiction)


	me = User.create(name: "Steven")
	julie = User.create(name: "Julie")
	tim  = User.create(name: "Tim")
	meryl = User.create(name: "Meryl")


	binding.pry
end