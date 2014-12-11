module.exports.controller = (app) ->
  app.all '/projects', (req, res) ->
    data = {}

    data.title = 'Projects'
    data.slug = data.title.toLowerCase()

    res.render 'projects', data