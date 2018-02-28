#core modules
path = require 'path'

#npm install
express = require 'express'
expressHandlebars = require 'express-handlebars'
handlebars = require 'handlebars'

# configuration for template engine
# which is more pernickerty than you'd expect
handlebarsEngineConfig = {
  handlebars: handlebars,
  extname: '.hbs',
  partialsDir: './views' #it's otherwise opinionated
}

# create an instance of the template engine with this config
handlebarsInstance = expressHandlebars.create(handlebarsEngineConfig)

# create express app
app = express()

# set up viewing and templating
app.engine('hbs', handlebarsInstance.engine)
app.set('view engine', 'hbs')
app.set('views', './views')
app.use express.static(path.join(__dirname, 'public'))

#homepage
app.get '/' , (req,res) ->
  res.status 200
  res.render 'home', {"variable":"value"}

port = process.env.PORT || 3000
app.listen port
console.log("running on port " + port)

#redirect 404s home
app.use (req,res,next) ->
  res.status(404).redirect('/')

module.exports = app

