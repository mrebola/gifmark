class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :titile
      t.string :url
      t.string :checksum

      t.timestamps
    end
  end
end
