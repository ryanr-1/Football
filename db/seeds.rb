# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# create 5 authors...
2.times do
  owner = Owner.create(
    name: Faker::Name.name,
  )

  # ...with 3 books each
  3.times do
    entry = Entry.create(
      title: Faker::entry.name,
      
      # no need to seed user_id, it'll do it for you. MAGIC!
    )
  end
end