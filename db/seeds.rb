# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bucketlist.destroy_all

5.times do
  bucketlist = Bucketlist.create(name: Faker::Company.buzzword)
  2.times do
    Item.create(
      name: Faker::Company.catch_phrase,
      bucketlist_id: bucketlist.id
    )
  end
end

# Generate a buzzword-laden catch phrase.
# Faker::Company.catch_phrase #=> "Business-focused coherent parallelism"
