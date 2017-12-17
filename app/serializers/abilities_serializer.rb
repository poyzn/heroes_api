class AbilitiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_ultimate
end
