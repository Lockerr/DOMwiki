class AddContactorIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :contactor_id, :integer
  end
end
