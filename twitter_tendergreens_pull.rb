#!/usr/bin/env ruby

require 'twitter'
require 'json'

config = {
  consumer_key: "ED5YnW97eZjc3vyZFhvso81Wl",
  consumer_secret: "vpUhMbRAGz9drXAzreFY8YGouVBLCtW8VDIiCNs7JAcgyCSZLy",
}

client = Twitter::REST::Client.new(config)

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

tweets = client.get_all_tweets("TenderGreens")
photos = tweets.collect { |obj| obj.attrs[:entities][:media]}

temp_list = []

tweets.each do |x| 
    if !x.attrs[:entities][:media].nil?
        photo = x.attrs[:entities][:media].first[:media_url]
        if !photo.nil?
            
            d = x.text.split().select { |x| x unless x.start_with?('#') || x.start_with?('http') || x.start_with?('RT')|| x.start_with?('@')}.join(' ')
            p = photo.split('/')[-1]
            

            temp_dict = {description: d, photo: p}
            temp_list.push(temp_dict)
        end
    end
end

file1 = File.new('tg_images.txt','w+')
file2 = File.new('tg.json','w+')

file2.puts temp_list.to_json

temp_list.each do |x|
    file1.puts x[:photo]
end


