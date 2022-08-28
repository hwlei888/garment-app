class AddBrandIdToGarments < ActiveRecord::Migration[5.2]
  def change
    add_column :garments, :brand_id, :integer
  end
end
