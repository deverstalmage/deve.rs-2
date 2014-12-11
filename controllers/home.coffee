module.exports.controller = (app) ->
  app.all '/', (req, res) ->
    data = {}

    data.title = 'Portfolio of Devers Talmage'
    data.slug = 'home'

    res.render 'home', data