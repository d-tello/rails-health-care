require 'faker'

def clear_database
  puts 'Clearing database'
  Schedule.destroy_all
  Company.destroy_all
end

def create_doctor
  company = Company.create!(name: Faker::Artist.name)
  (1..7).each do |day|
    opening_time = Time.new(2021, 3, 31, (rand 8..10))
    closing_time = Time.new(2021, 3, 31, (rand 16..18))
    schedule = Schedule.new(weekday: 1, opens_at: opening_time, closes_at: closing_time, closed: day >= 6)
    schedule.company = company
    schedule.save
  end
  puts "#{company.name} sucessfully created 🧑‍⚕️"
end

clear_database
9.times do
  create_doctor
end
