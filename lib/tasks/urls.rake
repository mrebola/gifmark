require 'net/http'
namespace :urls do

  desc "Check aviability of image urls"
  task :update => :environment do
  	gifs do |gif|
      res = Net::HTTP.get_response URI(gif.url)
      gif.update_attributes(response_code: res.code) if res.code != "200"
      print '.'
  	end
  end

  desc "Print code and urls"
  task :print => :environment do
  	gifs do |gif|
  	  puts "[#{gif.response_code}]: #{gif.url}" 
  	end
  end

  desc "Update and print results"
  task :check => [:update, :print]

  def gifs
  	Gif.all.each { |gif| yield gif } 
  end

end