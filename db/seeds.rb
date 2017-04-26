# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'craigslist'

# Populate the db with dogs
parsed_results = Craigslist.search
parsed_results.each do |result|
  dog = Dog.new
  dog.url = result[:url]
  dog.images = result[:images]
  dog.cats = [true, false].sample
  dog.children = [true, false].sample
  dog.energy = rand(1..5)
  dog.save
end
