class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.text :image
      t.integer :collocation_id

      t.timestamps
    end
  end
end
