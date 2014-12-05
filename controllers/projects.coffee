module.exports.controller = (app) ->
  app.all '/projects', (req, res) ->
    data = {}

    data.title = 'Projects'

    res.render 'projects', data