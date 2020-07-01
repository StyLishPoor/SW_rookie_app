class RenameEmailColumnToPeople < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :email, :mail
  end
end
