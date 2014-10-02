require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if :development

set :DictoCrap, o: 0, i: 1, l: 1, e: 3, s: 5, b: 6, t: 7, p: 9

configure :development do
  register Sinatra::Reloader
end

helpers do
  def anagram?(word1, word2)
    word1.split('').sort == word2.split('').sort
  end

  def crappify(word)
    word.split('').map { |c| settings.DictoCrap[c.to_sym] || c }.join
  end
end

get '/' do
  'Hola Caracola! Hola Carachocho!'
end

get '/anagram/:word1/:word2' do
  json word1: params[:word1],
       word2: params[:word2],
       anagram?: anagram?(params[:word1], params[:word2])
end

get '/crappy_password/:word' do
  pass = crappify(params[:word])
  if pass == params[:word]
    json crappy_pass: nil, why_error: 'nothing changed in crappyfication'
  else
    json crappy_pass: pass
  end
end

not_found do
  json error: 'bad url, check your arguments'
end

error do
  json error: 'ooops! something just broke'
end
