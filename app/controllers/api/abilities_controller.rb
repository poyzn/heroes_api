# frozen_string_literal: true

module API
  class AbilitiesController < APIController

    resource_description do
      name  'Abilities'
      short 'Authentication required'
    end
    
    api :GET, '/abilities', 'Returns list of abilities.'
    param :hero_id, :number, 'Hero ID'
    param :ultimate, :boolean, 'Ultimate ability. Default is null. if null, returns all abilities.'
    formats %w[json plain]
    example Requests::Abilities.index
    # example Responses::Abilities.many
    def index
      abilities = Ability.with_hero(params[:hero_id])
                         .with_ultimate(params[:ultimate])
      render json: abilities, each_serializer: AbilitiesSerializer
    end
  
    api :GET, '/abilities/:id', 'Returns ability.
                                 Includes heros with this ability'
    param :id, :number, 'Ability ID', required: true
    formats %w[json plain]
    # example Responses::Abilities.one
    def show
      ability = Ability.find params[:id]
      render json: ability, serializer: AbilitySerializer
    end
      
  end
end