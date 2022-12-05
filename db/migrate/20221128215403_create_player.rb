class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.timestamps
      t.integer :rating
      t.boolean :professional
    end
  end
end
