require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  @name = params.fetch('name')
  @word = Word.new(@name)
  @word.save()
  erb(:success_words)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions_form)
end

post('/definitions') do
  @definition_input = params.fetch('definition')
  @definition = Definition.new(@definition_input)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success_definitions)
end
