#!/bin/bash

curl -X POST -H 'Content-type: application/json' --data \
'{
     "update_id": 24063093,
     "message": {
         "message_id": 15894,
         "from": {
             "id": 222222789,
             "is_bot": false,
             "first_name": "Travis",
             "last_name": "Shears",
             "language_code": "en-US"
         },
         "chat": {
             "id": 953058570,
             "first_name": "Travis",
             "last_name": "Shears",
             "type": "private"
         },
         "date": 1506207666,
         "text": "https://hexdocs.pm/phoenix/testing.html#content"
     }
}' \
http://localhost:4000/api/message
