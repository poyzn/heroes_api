# README

A test project for the [code challenge](https://gist.github.com/lefty313/8cc3bb916c6d0b5a266eee3a1101dc96#file-codetask-md)

### Features
- Apipie for documentation with basic auth access
- Registration and authentication via API with Devise
- JWT as additional authorization Devise strategy
- Some API calls required authorization with JWT
- Filtering results with model scopes
- Rspec + Factory Bot tests for models and API calls
- Parsing heroes' remote data with rake task
- Active Admin as admin panel

### Prepare the project

* Ruby version: 2.4.1

* Database: PosgreSQL

1. Clone the repo.

2. Update the file with your databases `config/database.yml`.

3. Run `db:setup` to init database.

4. Run `bundle install` to install gems.

## Testing

Run the test suite `rspec`.

At this point all test should pass.

## Parsing Data

Run `rails heroes_source:parse` to fetch heroes data from remote source and persist it in DB.

## API

And now start the rails server `rails s` and let's have some fun!

Visit [Apipie path](http://localhost:3000/apipie) to get API documentation. 

Of course you can disable user authentication, and access API actions
 without it, but it's not interesting. Let's access our restricted API with auth token. 
First we should obtain it. You can get it from registration and authentication processes. 
Run from the terminal to register a new user:

```bash
$ curl -X POST -d 'user[email]=newuser@test.com&user[password]=123123123' -D - localhost:3000/api/users/sign_up
```

or authenticate with existed user:

```bash
$ curl -X POST -d 'user[email]=test@test.com&user[password]=123123123' -D - localhost:3000/api/users/sign_in
```
 
 Here's an example of response with Authorization header:
 
 ```bash
 HTTP/1.1 200 OK
 X-Frame-Options: SAMEORIGIN
 X-XSS-Protection: 1; mode=block
 X-Content-Type-Options: nosniff
 Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MTYxODI1MDl9.41O9gQW4_V3Ywy3Mn2VsHYl92Nac453cNOPn33w5G6U
 Content-Type: application/json; charset=utf-8
 ETag: W/"805dfd5764cb831055aaa353c2b728a3"
 Cache-Control: max-age=0, private, must-revalidate
 Set-Cookie: _heroes_session=Z0M5dVkyZW9FN3dZWm9HcnVoUms3SUhGVmI5dWczd2lhSC9HZ28vV2JTOUlaZlJQRzFSWVlROWl3QlBCZHMzYWQxSThTeDFTZk9nNENDc1dyMjh3Slp0Z3E4dVZtUkNKNXpoZ2h5bzVPV1p1K05GRmFKb0FQYnFNOUtyaU5vcnVnRExNUnc4MTZsZmpOdmx0WVgrcFZTeklGNFMxWEdNcHYweGYvNHpuUWI1U0tlT2RvMVAzTHgraWFMb1V0MWdGLS02RHg4Unl6TlZpc1kyT2QrdGpEWS9BPT0%3D--35a63d15f907801c31ac64f69d2b1a2f3a9e5b0d; path=/; HttpOnly
 X-Request-Id: 27d0d2ab-647c-4690-b38a-bed1085f7682
 X-Runtime: 0.238648
 Transfer-Encoding: chunked
 ```
 
 And the user info in the body:
 
 ```bash
 {"id":1,"email":"test@test.com","created_at":"2017-12-18T00:02:35.785Z"}
 ```
 
 To make using token easy put it into variable. Mind `Bearer` in the header according with W3C specification. 
 
 ```bash
 $ export token="Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MTYxODI1MDl9.41O9gQW4_V3Ywy3Mn2VsHYl92Nac453cNOPn33w5G6U"
 ```
 
 Now you able to access API calls with token in request header. 
 Without token you'll get 401 error. Here're examples of API calls:
 
 ```bash
 $ curl -X GET -H "$token" http://localhost:3000/api/heros
 $ curl -X GET -H "$token" http://localhost:3000/api/heros/13
 $ curl -X GET -H "$token" http://localhost:3000/api/heros/13/abilities
 $ curl -X GET -H "$token" http://localhost:3000/api/abilities
 $ curl -X GET -H "$token" http://localhost:3000/api/abilities/13
 ``` 
 
 Each time you'll get in response body a JSON object with persisted data or with error and 
 corresponding http status.
 For more information please access [Apipie documentation](http://localhost:3000/apipie).
 Use the next credentials:
 - username: `heroes`
 - password: `heroes`
 

## Admin panel

Visit [admin panel](http://localhost:3000/admin) to manage stored data.
- username: `admin@example.com`
- password: `password`

## Thank you!



