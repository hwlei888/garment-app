class CreateCollocationsGarments < ActiveRecord::Migration[5.2]
  def change
    create_table :collocations_garments do |t|
      t.integer :collocation_id
      t.integer :garment_id
    end
  end
end
