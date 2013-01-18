class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :category_id
      t.boolean :assessment
      t.text :description

      t.timestamps
    end
  end
end
