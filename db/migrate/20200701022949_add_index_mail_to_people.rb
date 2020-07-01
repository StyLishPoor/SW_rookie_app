class AddIndexMailToPeople < ActiveRecord::Migration[6.0]
  def change
    add_index :people, :mail, unique: true
  end
end
