class AddImageToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_url, :string
    add_attachment :products, :image
  end
end
