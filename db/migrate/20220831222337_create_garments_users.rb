class CreateGarmentsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :garments_users do |t|
      t.integer :garment_id
      t.integer :user_id
    end
  end
end
