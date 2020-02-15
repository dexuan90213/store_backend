class AddOriginalAndSellPriceToProductsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :original_price, :decimal
    add_column :products, :sell_price, :decimal
  end
end
