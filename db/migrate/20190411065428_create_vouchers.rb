class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      t.string   :name, index: true
      t.string   :desciption
      t.decimal  :discount_amount
      t.datetime :starts_at
      t.datetime :expires_at
      t.integer  :qty
      t.boolean  :is_fixed, default: false, null: false

      t.timestamps
    end
  end
end
