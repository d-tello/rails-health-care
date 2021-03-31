# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def clear_database
  puts 'Clearing database'
  Schedule.destroy_all
  Company.destroy_all
end

def create_company
  company = Company.create!(name: 'A random name')
  puts "#{company.name} created"
  opening_time = Time.new(2021, 3, 31, 8)
  closing_time = Time.new(2021, 3, 31, 18)
  schedule = Schedule.new(opens_at: opening_time.strftime('%k:%M'),
                          closes_at: closing_time.strftime('%k:%M'))
  schedule.company = company
  schedule.save
  puts "#{company.name} opens at #{schedule.opens_at} and closes at #{schedule.closes_at}"
end

clear_database
create_company
