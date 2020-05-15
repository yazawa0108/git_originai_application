class AddDatetimeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :datetime, :date
  end
end
