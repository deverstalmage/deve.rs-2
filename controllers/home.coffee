module.exports.controller = (app) ->
  app.all '/', (req, res) ->
    data = {}

    data.title = 'Portfolio of Devers Talmage'
    data.name = 'devers'
    data.location = 'northampton'
    
    res.render 'home', data