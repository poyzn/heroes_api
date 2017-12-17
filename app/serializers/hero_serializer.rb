class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :real_name, :health, :armour, :shield
  has_many :abilities
end
