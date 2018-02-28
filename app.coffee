express = require 'express'

app = express()

app.use express.static('public')

app.get '/' , (req,res) ->
  res.send 'hello world'

app.listen process.env.PORT || 3000

