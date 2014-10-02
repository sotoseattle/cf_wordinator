require 'sinatra'
require "sinatra/json"
require "sinatra/reloader" if :development

configure :development do
  register Sinatra::Reloader
end

helpers do
  def anagram?(word1, word2)
    return false if word1.size!=word2.size

    h = Hash.new(0)
    word1.split('').each { |c| h[c] += 1 }
    word2.split('').each do |c|
      if h.has_key?(c)
        h[c] -= 1
      else
        return false
      end
    end
    h.values.all? { |v| v == 0 }
  end
end


get '/' do
  "Hola Caracola! Hola Carachocho!"
end

get '/anagram/:word1/:word2' do
  json :anagram? => anagram?(params[:word1], params[:word2])
end
