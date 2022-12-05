class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.timestamps
      t.boolean :won
      t.integer :number_of_moves 
    end
  end
end
