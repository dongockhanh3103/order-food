class CreateOrderTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string     :state
      t.references :user, foreign_key: true, null: false
      t.references :voucher, foreign_key: true
      t.decimal    :total
      t.decimal    :raw

      t.timestamps
    end
  end
end
