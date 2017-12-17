module Requests
  class Heroes
    class << self
      
      def index
        <<-EOS
Request examples:
{ "health_min": 20, "health_max": 80 }

curl -X GET -H "Authorization: Bearer token" \\
     -d '{ "health_min": 20, "health_max": 80 }' \\
     -H 'Content-Type: application/json' localhost:3000/api/heroes
        EOS
      end

      def show
        <<-EOS
Request example:
curl -X GET -H "Authorization: Bearer token" localhost:3000/api/heroes/1
        EOS
      end
      
    end
  end
end