bodyParser = require('body-parser')
express    = require 'express'
path       = require 'path'
fs         = require 'fs'

# Web Server section of system
app = express()

app.use bodyParser.urlencoded({ extended: false })
app.use bodyParser.json()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'ejs'
app.use express.static(__dirname + '/public')


app.get '/', (req, res)->
  res.render 'index'

app.get '/page-2', (req, res)->
  res.render 'list_page_2'

app.get '/page-3', (req, res)->
  res.render 'list_page_3'

module.exports = 
  app : app

if !module.parent
  # Start tutorial server
  port = process.argv[2] || 10003
  app.listen port
  console.log "Tutorial server listening at port : %s", port