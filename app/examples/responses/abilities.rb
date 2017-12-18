module Responses
  class Abilities
    def self.many
      <<-EOS
Response example:
[
  {
    "id": 1,
    "name": "Biotic Rifle",
    "description": "Ana’s rifle shoots darts that can restore health to her allies or deal ongoing damage to her enemies. She can use the rifle’s scope to zoom in on targets and make highly accurate shots.",
    "is_ultimate": false
  },
  {
    "id": 2,
    "name": "Sleep Dart",
    "description": "Ana fires a dart from her sidearm, rendering an enemy unconscious (though any damage will rouse them).",
    "is_ultimate": false
  },
  {
    "id": 3,
    "name": "Biotic Grenade",
    "description": "Ana tosses a biotic bomb that deals damage to enemies and heals allies in a small area of effect. Affected allies briefly receive increased healing from all sources, while enemies caught in the blast cannot be healed for a few moments.",
    "is_ultimate": false
  }
]
      EOS
    end

    def self.one
      <<-EOS
Response example:
{
  "id": 13,
  "name": "Eject",
  "description": "D.Va ejects out of her mech when it is destroyed.",
  "is_ultimate": false,
  "heroes": [
    {
      "id": 3,
      "name": "D.Va",
      "real_name": "Hana Song",
      "health": 200,
      "armour": 400,
      "shield": 0
    }
  ]
}
      EOS
    end
    
  end
end