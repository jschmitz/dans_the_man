class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :address_id
      t.integer :guest_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.boolean :twenty_one
      t.boolean :eighteen

      t.timestamps
    end
  end
end
