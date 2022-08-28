class CreateGarments < ActiveRecord::Migration[5.2]
  def change
    create_table :garments do |t|
      t.text :name
      t.float :price
      t.text :fabrication
      t.text :image

      t.timestamps
    end
  end
end
