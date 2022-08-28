class CreateCollocations < ActiveRecord::Migration[5.2]
  def change
    create_table :collocations do |t|
      t.string :title
      t.text :introduction
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
