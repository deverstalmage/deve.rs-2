compression = require 'compression'
express = require 'express'
app = express()

home = require './controllers/home'
skills = require './controllers/skills'
projects = require './controllers/projects'

app.set 'view engine', 'jade'
app.use express.static __dirname + '/static'
app.use compression()

home.controller app
skills.controller app
projects.controller app

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port
  console.log 'an example app running on %s:%s', host, port