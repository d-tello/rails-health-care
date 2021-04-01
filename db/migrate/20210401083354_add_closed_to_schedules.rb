class AddClosedToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :closed, :boolean
  end
end
