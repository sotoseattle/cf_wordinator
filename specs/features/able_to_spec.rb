require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Wordinator' do
  it 'should successfully return a greeting from root' do
    get '/'
    last_response.status.must_equal 200
    last_response.body.must_include 'Caracola'
  end

  describe '#not found' do
    it 'brings back json error if bad url' do
      get '/anagram/'
      JSON.parse(last_response.body).keys.must_include 'error'
    end
  end

  describe '#anagram' do
    it 'should detect when a word is an anagram' do
      get '/anagram/silent/listen'
      JSON.parse(last_response.body)['anagram?'].must_equal true
    end

    it 'should detect when a word is an anagram' do
      get '/anagram/aaabbb/ababab'
      JSON.parse(last_response.body)['anagram?'].must_equal true
    end

    it 'should detect when a word is not an anagram' do
      get '/anagram/silent/listQn'
      JSON.parse(last_response.body)['anagram?'].must_equal false
    end

    it 'should detect when a word is not an anagram' do
      get '/anagram/silent/listn'
      JSON.parse(last_response.body)['anagram?'].must_equal false
    end
  end

  describe '#generate_crappy_password' do
    it 'should convert a word to a crappy password' do
      get '/crappy_password/kittens'
      JSON.parse(last_response.body)['crappy_pass'].must_equal 'k1773n5'
    end

    it 'if it cannot change the word it returns nil' do
      get '/crappy_password/juan'
      JSON.parse(last_response.body)['crappy_pass'].must_equal nil
      JSON.parse(last_response.body)['why_error'].must_equal 'nothing changed in crappyfication'
    end
  end
end
