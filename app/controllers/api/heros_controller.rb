# frozen_string_literal: true

module API
  class HerosController < APIController

    resource_description do
      name  'Heroes'
      short 'Authentication required'
    end
    
    api :GET, '/heros', 'Returns list of heroes.'
    param :health_min, :number, 'Minimum health'
    param :health_max, :number, 'Maximum health'
    formats %w[json plain]
    example Requests::Heroes.index
    example Responses::Heroes.many
    def index
      heroes = Hero.with_health(params[:health_min], params[:health_max])
      render json: heroes, each_serializer: HeroesSerializer
    end
  
    api :GET, '/heros/:id', 'Returns hero\'s data
                             with abilities.'
    param :id, :number, 'Hero ID', required: true
    formats %w[json plain]
    example Requests::Heroes.show
    example Responses::Heroes.one
    def show
      hero = Hero.find params[:id]
      render json: hero, serializer: HeroSerializer
    end
    
  end
end