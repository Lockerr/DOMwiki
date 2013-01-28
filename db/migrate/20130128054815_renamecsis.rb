class Renamecsis < ActiveRecord::Migration
  def up
    drop_table :companies
    rename_table :csis, :companies
  end

  def down
  end
end
