class HeroParser
  require 'open-uri'
  
  HEROES_URL      = 'https://overwatch-api.net/api/v1/hero/'
  HERO_URL        = 'https://overwatch-api.net/api/v1/hero/%d'
  ABILITIES_URL   = 'https://overwatch-api.net/api/v1/ability/'
  ABILITY_URL     = 'https://overwatch-api.net/api/v1/ability/%d'
  
  def get_heroes
    parse(HEROES_URL)['data']
  end

  def get_hero(id)
    parse(sprintf HERO_URL, id)
  end

  def get_abilities
    parse(ABILITIES_URL)
  end

  def get_ability(id)
    parse(sprintf ABILITY_URL, id)
  end
  
  def parse(url)
    JSON.parse open(url).read if url
  end
end
