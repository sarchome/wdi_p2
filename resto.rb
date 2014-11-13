#!/usr/bin/env ruby

require 'json'

file = File.read('app/assets/images/food/tg.json')
data_hash = JSON.parse(file)

data_hash[0..20].each do |x|
    h =  MenuItem.new(x)
    h.save
end

