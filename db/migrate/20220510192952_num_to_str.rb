class NumToStr < ActiveRecord::Migration[7.0]
  def change
    change_column :comics, :number, :string
  end
end
