class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :attachable, polymorphic: true
      t.attachment :data
      t.string :photo_type
      t.timestamps
    end
  end
end
