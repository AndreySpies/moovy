class AddMiniatureToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :miniature, :string
  end
end
