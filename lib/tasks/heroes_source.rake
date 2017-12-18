namespace :heroes_source do
  
  task parse: :environment do
    parser = HeroParser.new
    heroes_data = parser.get_heroes
    heroes = []
    if heroes_data.any?
      puts 'Start parsing heroes data'
      puts '-------------------------'
      heroes_data.each do |data|
        hero = Hero.create(data.extract!('id', 'name', 'real_name', 'health', 'armour', 'shield'))
        heroes << hero
        puts "Added Hero with name #{hero.name}"
      end
    end
    if heroes.any?
      heroes.each do |hero|
        puts "Start parsing abilities for #{hero.name}"
        abilities = parser.get_hero(hero.id)['abilities']
        abilities.each do |data|
          ability = Ability.find_or_create_by(id: data['id']) do |a|
              a.id          = data['id']
              a.name        = data['name']
              a.description = data['description']
              a.is_ultimate = data['is_ultimate']
          end
          hero.abilities << ability
          puts "Ability #{ability.name} added to hero #{hero.name}"
        end
        puts 'next hero -->'
        sleep 1
      end
    end
    puts 'Parsing is finished'
  end
  
end
