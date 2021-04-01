# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def clear_database
  puts 'Clearing database'
  Schedule.destroy_all
  Company.destroy_all
end

def create_company
  company = Company.create!(name: Faker::Artist.name)
  opening_time = Time.new(2021, 3, 31, (rand 8..10))
  closing_time = Time.new(2021, 3, 31, (rand 16..18))
  monday = Schedule.new(weekday: 1, opens_at: opening_time.strftime('%k:%M'),
                        closes_at: closing_time.strftime('%k:%M'))
  tuesday = Schedule.new(weekday: 2, opens_at: opening_time.strftime('%k:%M'),
                         closes_at: closing_time.strftime('%k:%M'))
  wednesday = Schedule.new(weekday: 3, opens_at: opening_time.strftime('%k:%M'),
                           closes_at: closing_time.strftime('%k:%M'))
  thursday = Schedule.new(weekday: 4, opens_at: opening_time.strftime('%k:%M'),
                          closes_at: closing_time.strftime('%k:%M'))
  friday = Schedule.new(weekday: 5, opens_at: opening_time.strftime('%k:%M'),
                        closes_at: closing_time.strftime('%k:%M'))
  saturday = Schedule.new(weekday: 6, opens_at: opening_time.strftime('%k:%M'),
                          closes_at: closing_time.strftime('%k:%M'), closed: true)
  sunday = Schedule.new(weekday: 7, opens_at: opening_time.strftime('%k:%M'),
                        closes_at: closing_time.strftime('%k:%M'), closed: true)
  monday.company = company
  monday.save
  tuesday.company = company
  tuesday.save
  wednesday.company = company
  wednesday.save
  thursday.company = company
  thursday.save
  friday.company = company
  friday.save
  saturday.company = company
  saturday.save
  sunday.company = company
  sunday.save
  puts "#{company.name} sucessfully created"
end

clear_database
9.times do
create_company
end
