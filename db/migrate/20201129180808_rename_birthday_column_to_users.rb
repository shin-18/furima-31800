class RenameBirthdayColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :birthday, :birthday_id
  end
end
