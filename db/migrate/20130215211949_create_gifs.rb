class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :title
      t.string :url
      t.string :checksum
      t.string :response_code

      t.timestamps
    end
    add_index :gifs, :title
  end
end
