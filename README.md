Backend of Warm Meadow Chat App
===============================


* An API exposes a wesbite's data so that it can easily be consumed by the person requesting it. In order to do this, we have rendered out data in json.

* https://warm-meadow-2141.herokuapp.com/messages

* GET and POST methods can be used.

* URL Extensions for methods:

* leaderboard:  get "https://warm-meadow-2141.herokuapp.com/messages/leaderboard"
recently active users:  get "https://warm-meadow-2141.herokuapp.com/messages/recent_users"
* most active chatrooms:  get "https://warm-meadow-2141.herokuapp.com/messages/active_chatrooms"
* messages in the last 5 minutes organized by chatroom:  get "https://warm-meadow-2141.herokuapp.com/messages/:chatroom"
* all messages sent by a specific username:  get "https://warm-meadow-2141.herokuapp.com/messages/profile/:username"
* all messages history:  get "https://warm-meadow-2141.herokuapp.com/messages"
* create a new message:  post "https://warm-meadow-2141.herokuapp.com/messages"
