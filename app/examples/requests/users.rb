module Requests
  class Users
    class << self
      def sign_up
        <<-EOS
Request examples:
{ "user": { "email": "test@test.com", "password": "123123123" } }

user[email]=test@test.com&user[password]=123123123

curl -X POST -d 'user[email]=test@test.com&user[password]=123123123' -D - http://localhost:3000/api/users/sign_up

Example of authorization header with auth token in response:
Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMzUsImV4cCI6MTUxMDgzMjExOX0.FP2LHBQcV9trJGRUwkbsKYZPToIjg-pDSAJaMgQVD-Y
        EOS
      end
      
      def sign_in
        <<-EOS
Request examples:
{"user": { "email": "test@test.com", "password": "123123123"}}

user[email]=test@test.com&user[password]=123123123

curl -X POST -d 'user[email]=test@test.com&user[password]=123123123' -D - http://localhost:3000/api/users/sign_in

Example of authorization header with auth token in response:
Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMzUsImV4cCI6MTUxMDgzMjExOX0.FP2LHBQcV9trJGRUwkbsKYZPToIjg-pDSAJaMgQVD-Y
        EOS
      end
    end
  end
end