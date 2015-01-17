compression = require 'compression'
express = require 'express'
app = express()

home = require './controllers/home'
skills = require './controllers/skills'
projects = require './controllers/projects'
contact = require './controllers/contact'

port = process.env.DEVERS_PORT or 3000

app.set 'view engine', 'jade'
app.use express.static __dirname + '/static'
app.use express.static __dirname + '/blog'
app.use '/images', express.static __dirname + '/static/images/compressed'
app.use compression()

home.controller app
skills.controller app
projects.controller app
contact.controller app

server = app.listen port, ->
  host = server.address().address
  port = server.address().port
  console.log 'an example app running on %s:%s', host, port