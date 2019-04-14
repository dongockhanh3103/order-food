class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, index: true, unique: true
      t.decimal :price, default: 0
      t.decimal :tax
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
