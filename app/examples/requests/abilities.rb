module Requests
  class Abilities
    class << self
      
      def index
        <<-EOS
Request examples:
{ "ultimate": true }

ultimate=1

curl -X GET -H "Authorization: Bearer token" -d '{ "ultimate": true }' \\
     -H 'Content-Type: application/json' localhost:3000/api/abilities
        EOS
      end

      def show
        <<-EOS
Request examples:
curl -X GET -H "Authorization: Bearer token" localhost:3000/api/abilities/1
        EOS
      end
      
    end
  end
end