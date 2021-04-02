class RenameClosedToOpen < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :closed, :open
  end
end
