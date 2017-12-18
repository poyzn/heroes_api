class Hero < ApplicationRecord
  has_many :hero_abilities, dependent: :destroy
  has_many :abilities, through: :hero_abilities
  
  validates :name, presence: true
  validates :real_name, presence: true
  validates :health, numericality: { greater_than_or_equal_to: 0 }
  validates :armour, numericality: { greater_than_or_equal_to: 0 }
  validates :shield, numericality: { greater_than_or_equal_to: 0 }
  
  scope :with_health, ->(health_min=nil, health_max=nil) {
    if health_min && health_max
      where('health BETWEEN ? AND ?', health_min, health_max)
    elsif health_min
      where('health >= ?', health_min)
    elsif health_max
      where('health <= ?', health_max)
    else
      all
    end
  }
  
  class << self
    def permitted_params
      [:name, :real_name, :health, :shield, :armour]
    end
  end
  
end
