class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.text :title

      t.timestamps
    end
  end
end
