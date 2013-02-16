module GifWorker
	include Sidekiq::Worker

	def perform gif_id
		gif = Gif.find(gif_id)
		gif.checksum = Digest::SHA1.hexdigest( open(url) {|file| file.read } )
		gif.destroy unless gif.valid?
	end
end