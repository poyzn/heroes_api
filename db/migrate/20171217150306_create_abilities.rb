class CreateAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :description, default: ""
      t.boolean :is_ultimate, default: false
      t.timestamps
    end
  end
end
