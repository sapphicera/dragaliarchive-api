class CreateComicCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :comic_characters do |t|
      t.integer :comic_id
      t.integer :character_id

      t.timestamps
    end
  end
end
