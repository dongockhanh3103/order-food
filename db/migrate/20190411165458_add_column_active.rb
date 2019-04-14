class AddColumnActive < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :active, :boolean, default: true
    add_column :products, :active, :boolean, default: true
  end
end
