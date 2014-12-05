module.exports.controller = (app) ->
  app.all '/skills', (req, res) ->
    data = {}

    data.title = 'Skills'

    res.render 'skills', data