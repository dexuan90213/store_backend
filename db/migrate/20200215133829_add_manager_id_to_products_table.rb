class AddManagerIdToProductsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :manager
  end
end
