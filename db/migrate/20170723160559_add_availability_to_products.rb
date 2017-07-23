class AddAvailabilityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :available, :boolean
    add_column :products, :unit, :string
  end
end
