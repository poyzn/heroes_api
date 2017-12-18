module Responses
  class Users
    class << self
      def one
        <<-EOS
Response example:
{
  "id": 1,
  "email": "test@test.com",
  "created_at": "2017-12-18T11:26:15.783Z"
}
        EOS
      end
    end
  end
end