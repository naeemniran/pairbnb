class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :price
      t.integer :max_guests

      t.timestamps
    end
  end
end
