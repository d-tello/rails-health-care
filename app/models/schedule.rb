class Schedule < ApplicationRecord
  # Associations
  belongs_to :company
  # Attributes
  attribute :open, :boolean, default: false
end
