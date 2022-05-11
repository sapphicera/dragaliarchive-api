class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :element
      t.string :type

      t.timestamps
    end
  end
end
