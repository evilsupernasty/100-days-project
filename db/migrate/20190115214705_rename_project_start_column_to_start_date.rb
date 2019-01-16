class RenameProjectStartColumnToStartDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :start, :start_date
  end
end
