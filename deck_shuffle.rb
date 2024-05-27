# frozen_string_literal: true
require 'uri'
require 'net/http'

structure_first = '"success":'
structure_second = '"deck_id":'
structure_third = '"remaining":'
structure_fourth = '"shuffled":'
uri = URI('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
res = Net::HTTP.get_response(uri)
str = res.body
list = str.split(',')
for i in 0..list.length-1
  puts list[i]
end
if list[0].include?(structure_first) and
  list[1].include?(structure_second) and
  list[2].include?(structure_third) and
  list[3].include?(structure_fourth)
  puts "response body matches the schema from documentation"
else
  puts "response body does not matches the schema from documentation"
end






