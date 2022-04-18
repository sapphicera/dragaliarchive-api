class CreateAlliances < ActiveRecord::Migration[7.0]
  def change
    create_table :alliances do |t|
      t.string :name
      t.string :icon
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
