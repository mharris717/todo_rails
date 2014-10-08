# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Todo,Post].each do |cls|
  cls.delete_all

  (1..10).each do |i|
    cls.create! name: "Clean Gutters #{i}", completed: false
    cls.create! name: "Make Dinner #{i}", completed: false
    cls.create! name: "More Stuff #{i}", completed: false
  end
end