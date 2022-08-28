class CreateGarmentsOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :garments_occasions do |t|
      t.integer :garment_id
      t.integer :occasion_id
    end
  end
end
