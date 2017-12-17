module Responses
  class Chats
    def self.get
      <<-EOS
      Пример ответа:
      [
        #{self.single}
      ]
      EOS
    end

    def self.post
      <<-EOS
      Пример ответа:
      #{self.single}
      EOS
    end
    
    def self.single
      <<-EOS
      {
        "id":15,
        "name":null,
        "private":true,
        "users":[
          {
            "id":350,
            "avatar":{
              "url":"/uploads/user/avatar/c109dd6eee25d921.jpg",
              "thumb":{
                "url":"/uploads/user/avatar/thumb_c109dd6eee25d921.jpg"
              },
              "medium":{
                "url":"/uploads/user/avatar/medium_c109dd6eee25d921.jpg"
              }
            },
            "full_name":"Anton Grigoriev",
            "last_name":"Grigoriev",
            "first_name":"Anton",
            "updated_at":"2017-11-16T17:55:28.400+03:00"
          },
          {
            "id":358,
            "avatar":{
              "url":null,
              "thumb":{
                "url":null
              },
              "medium":{
                "url":null
              }
            },
            "full_name":"qweqwe asdasd",
            "last_name":"asdasd",
            "first_name":"qweqwe",
            "updated_at":"2017-11-10T00:47:20.097+03:00"
          }
        ],
        "last_message":{
          "id":155,
          "chat_id":15,
          "content":"Ку-ку",
          "photo":{
            "url":null
          },
          "video":{
            "url":null,
            "thumb":{
              "url":null
            }
          },
          "read_by": [],
          "deleted_by": [],
          "created_at": "",
          "author":{
            "id":350,
            "avatar":{
              "url":"/uploads/user/avatar/c109dd6eee25d921.jpg",
              "thumb":{
                "url":"/uploads/user/avatar/thumb_c109dd6eee25d921.jpg"
              },
              "medium":{
                "url":"/uploads/user/avatar/medium_c109dd6eee25d921.jpg"
              }
            },
            "full_name":"Anton Grigoriev",
            "last_name":"Grigoriev",
            "first_name":"Anton",
            "updated_at":"2017-11-16T17:55:28.400+03:00"
          }
        }
      }
      EOS
    end
  end
end