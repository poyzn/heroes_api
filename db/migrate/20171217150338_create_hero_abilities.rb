class CreateHeroAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :hero_abilities do |t|
      t.references :hero, foreign_key: true
      t.references :ability, foreign_key: true
    end
  end
end
