#!/bin/bash

curl -X POST -H 'Content-type: application/json' --data \
'{
     "update_id": 24063093,
     "message": {
         "message_id": 15894,
         "from": {
             "id": 123456789,
             "is_bot": false,
             "first_name": "Lorenz",
             "last_name": "Klopfenstein",
             "username": "LorenzCK",
             "language_code": "en-US"
         },
         "chat": {
             "id": 123456789,
             "first_name": "Lorenz",
             "last_name": "Klopfenstein",
             "username": "LorenzCK",
             "type": "private"
         },
         "date": 1506207666,
         "text": "/start",
         "entities": [
             {
                 "offset": 0,
                 "length": 6,
                 "type": "bot_command"
             }
         ]
     }
}' \
http://localhost:4000/api/message
