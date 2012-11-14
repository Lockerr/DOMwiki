class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :assessment
      t.string :bugs
      t.string :description
      t.string :keywords
      t.text :body

      t.timestamps
    end
  end
end
