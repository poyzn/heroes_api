class Ability < ApplicationRecord
  has_many :hero_abilities, dependent: :destroy
  has_many :heroes, through: :hero_abilities
  
  validates :name, presence: true
  
  scope :with_hero, ->(hero_id=nil) {
    hero_id ? joins(:hero_abilities).where(hero_abilities: { hero_id: hero_id }) : all
  }
  scope :with_ultimate, ->(ultimate=nil) {
    ultimate ? where(is_ultimate: ultimate) : all
  }

  class << self
    def permitted_params
      [:name, :description, :is_ultimate]
    end
  end
  
end
