module.exports.controller = (app) ->
  app.all '/skills', (req, res) ->
    data = {}

    data.title = 'Skills'
    data.slug = data.title.toLowerCase()

    res.render 'skills', data