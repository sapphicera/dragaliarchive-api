class CreateComics < ActiveRecord::Migration[7.0]
  def change
    create_table :comics do |t|
      t.integer :number
      t.string :enName
      t.string :jpName
      t.string :chsName
      t.string :chtName

      t.timestamps
    end
  end
end
