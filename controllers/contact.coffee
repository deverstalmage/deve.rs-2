module.exports.controller = (app) ->
  app.all '/contact', (req, res) ->
    data = {}

    data.title = 'Contact'
    data.slug = data.title.toLowerCase()

    res.render 'contact', data