class AddMatrixToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :matrix, :string
  end
end
