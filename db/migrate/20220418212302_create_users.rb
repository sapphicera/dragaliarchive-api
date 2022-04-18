class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :icon
      t.string :ign
      t.integer :alliance_id
      t.integer :level
      t.integer :gameid
      t.text :description
      t.string :weapon
      t.string :element
      t.string :event
      t.string :fight

      t.timestamps
    end
  end
end
