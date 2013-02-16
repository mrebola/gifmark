require 'open-uri'
require 'digest/sha1'

class Gif < ActiveRecord::Base
  attr_accessible :title, :url, :response_code, :tag_list
  acts_as_taggable
  validates :title, presence: true
  validates :url  , presence: true, uniqueness: true,
                  format: { with: /^https*:\/\/[\w\S]+\/([\w\S]+\.gif)$/, message: "File url not valid" }
  validates :checksum, uniqueness: true, allow_blank: true

  before_save :verify_by_checksum, on: :create

  scope :ok, where(response_code: "200")

  def self.search query
    if query
  	  ok.basic_search(title: query)
    else
      ok.order('created_at DESC')
    end
  end

  def verify_by_checksum
  	self.checksum = Digest::SHA1.hexdigest( open(url) {|file| file.read } )
    self.response_code = "200" if self.checksum 
  end
end
