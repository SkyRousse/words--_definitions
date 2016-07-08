require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/definitions') do
  @definitions = Definitions.all()
  erb(:definitions)
end

get('/words/new') do
  erb(:words_form)
end
