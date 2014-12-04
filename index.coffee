express = require 'express'
app = express()

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index',
    title: 'yoooo'
    message: 'ayyy lmao'

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port
  console.log 'example app running on %s:%s', host, port