module Responses
  class Heroes
    def self.many
      <<-EOS
Response example:
[
  {
    "id": 1,
    "name": "Ana",
    "real_name": "Ana Amari",
    "health": 200,
    "armour": 0,
    "shield": 0
  },
  {
    "id": 2,
    "name": "Bastion",
    "real_name": "SST Laboratories Siege Automaton E54",
    "health": 200,
    "armour": 100,
    "shield": 0
  },
  {
    "id": 3,
    "name": "D.Va",
    "real_name": "Hana Song",
    "health": 200,
    "armour": 400,
    "shield": 0
  }
]
      EOS
    end

    def self.one
      <<-EOS
Response example:
{
  "id": 1,
  "name": "Ana",
  "real_name": "Ana Amari",
  "health": 200,
  "armour": 0,
  "shield": 0,
  "abilities": [
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
    },
    {
      "id": 4,
      "name": "Nano Boost",
      "description": "After Ana hits one of her allies with a combat boost, they temporarily move faster, deal more damage, and take less damage from enemies’ attacks.",
      "is_ultimate": true
    }
  ]
}
      EOS
    end
    
  end
end