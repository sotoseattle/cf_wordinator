# WORDINATOR

A simple app to query about words and their properties.

Send your query as a url and receive a json response


### Technological Characteristics:
- Small footprint: Sinatra (Ruby) and Thin server
- Simple, no database, no complications
- Tested with Minitests Specs framework

### Implement

- clone from github
- bundle install
- execute wordinator
```$ ruby wordinator.rb```
- use browser to the indicated port
```http://localhost:4567/anagram/silent/listen```
- or use any other means to access the service (curl, wget, etc.)

### Functionality
##### Anagrams

Detect if two words are anagrammatically analogous!

```text
input as path => '/anagram/silent/listen'
json response => {"answer":true}
```

