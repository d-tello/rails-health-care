class Company < ApplicationRecord
  # Associations
  has_many :schedules
  accepts_nested_attributes_for :schedules, allow_destroy: true
  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
