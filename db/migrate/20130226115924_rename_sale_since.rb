class RenameSaleSince < ActiveRecord::Migration
  def change
    rename_column :companies, :sale_since, :sales_since
  end
end
