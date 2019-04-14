class AddColumnQuantityToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :quantity, :integer
    add_column :order_products, :quantity, :integer
  end
end
