class Schedule < ApplicationRecord
  # Associations
  belongs_to :company
  # Attributes
  attribute :closed, :boolean, default: false
end
