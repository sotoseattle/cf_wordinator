require 'sinatra'
require "sinatra/json"
require "sinatra/reloader" if :development

configure :development do
  register Sinatra::Reloader
end

helpers do
  def anagram?(word1, word2)
    word1.split('').sort == word2.split('').sort
  end
end

get '/' do
  "Hola Caracola! Hola Carachocho!"
end

get '/anagram/:word1/:word2' do
  json word1: params[:word1],
       word2: params[:word2],
       anagram?: anagram?(params[:word1], params[:word2])
end
