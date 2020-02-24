class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :haunted_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
