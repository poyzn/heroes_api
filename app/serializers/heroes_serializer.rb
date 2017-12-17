class HeroesSerializer < ActiveModel::Serializer
  attributes :id, :name, :real_name, :health, :armour, :shield
end
