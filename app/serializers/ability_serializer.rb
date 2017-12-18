class AbilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_ultimate
  has_many :heroes, serializer: HeroesSerializer
end
