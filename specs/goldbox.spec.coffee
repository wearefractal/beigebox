#>> Setup

require('./goldbox').pollute()

connect rayoConfig, (conn) ->
  conn.on 'offer', (call) ->
    call.answer ->
      call.say "Select a song from the following options. #{getSongs()}", ->
        call.ask 'Enter your selection now', (input) ->
          if input < songs.length
            call.audio songs[input].url
          else
            call.say 'Invalid song selection'


songs = [
  {name:"Michael Jackson - Thriller", url:"http://dl.soundowl.com/47m.mp3"},
  {name:"The Beach Boys - Wouldn't It Be Nice", url:"http://dl.soundowl.com/15ty.mp3"},
  {name:"Flying Lotus - Do the Astral Plane", url:"http://dl.soundowl.com/4cp.mp3"}
]

getSongs = -> songs.map (song, idx) -> "Press #{idx} for #{song.name}. "
