class CreateMistakes < ActiveRecord::Migration
  def change
    create_table :mistakes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
