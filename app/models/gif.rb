require 'open-uri'
require 'digest/sha1'

class Gif < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, presence: true
  validates :url, :checksum, uniqueness: true

  before_save :calculate_checksum, on: :create

  def self.search query
  	basic_search(title: query)  	
  end

  def calculate_checksum
  	self.checksum = Digest::SHA1.hexdigest( open(url) {|file| file.read } )
  end
end
