class CreateBrandsCompanies < ActiveRecord::Migration
  def up
    create_table :brands_companies, id: false do |t|
      t.integer :company_id
      t.integer :brand_id
    end
  end

  def down
  end
end
