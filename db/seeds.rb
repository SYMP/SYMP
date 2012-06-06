# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 ruby encoding: utf-8


User.create({"name"=>"Thomas", "pw_hash"=>"pw", "birthdate"=>"1981-05-25", "city"=>"Halle"})
User.create({"name"=>"Daniel", "pw_hash"=>"pw", "birthdate"=>"1981-05-25", "city"=>"Berlin"})
User.create({"name"=>"Susanne", "pw_hash"=>"pw", "birthdate"=>"1981-05-25", "city"=>"Berlin"})
User.create({"name"=>"Nina", "pw_hash"=>"pw", "birthdate"=>"1981-05-25", "city"=>"Stuttgart"})
#User.create({"name"=>"Stephan", "pw_hash"=>"pw", "birthdate"=>"1981-05-25", "city"=>"Köln"})