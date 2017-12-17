class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :real_name
      t.integer :health, default: 100
      t.integer :armour, default: 0
      t.integer :shield, default: 0
      t.timestamps
    end
  end
end
