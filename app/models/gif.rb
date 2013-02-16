require 'open-uri'
require 'digest/sha1'

class Gif < ActiveRecord::Base
  attr_accessible :title, :url, :tag_list
  acts_as_taggable
  validates :url, presence: true, uniqueness: true
  validates :checksum, uniqueness: true, allow_blank: true

  after_save :calculate_checksum, on: :create

  def self.search query
    if query
  	  basic_search(title: query)
    else
      order('created_at DESC')
    end
  end

  def calculate_checksum
    GifWorker.perform_async( self.id )
  end
end
