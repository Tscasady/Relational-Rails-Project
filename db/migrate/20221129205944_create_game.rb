class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.timestamps
      t.boolean :won?
      t.string :pieces
    end
  end
end
