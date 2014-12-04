express = require 'express'
app = express()

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'home',
    title: 'yoooo biatch'

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port
  console.log 'an example app running on %s:%s', host, port