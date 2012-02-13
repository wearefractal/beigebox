beige  = require 'beigebox'
config = './BeigeBox.config'

beige.connect config, (conn) -> conn.on 'call', (call) ->

    call.answer ->

      call.say "Hello!", ->
        call.ask "What's your name?", (name) -> 
          call.say "Welcome, #{ name }!"
