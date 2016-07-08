require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/definitions') do
  @definitions = Definition.all()
  erb(:definitions)
end

get('/words/new') do
  erb(:words_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:success_words)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/word/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definitions_form)
end

get('/definitions/new') do
  erb(:definitions_form)
end

post('/definitions') do
  description = params.fetch('description')
  @description = Definition.new(description)
  @description.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@description)
  erb(:success_definitions)
end
