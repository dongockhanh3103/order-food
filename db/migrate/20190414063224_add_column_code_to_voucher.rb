class AddColumnCodeToVoucher < ActiveRecord::Migration[5.2]
  def change
    remove_column :vouchers, :name
    add_column    :vouchers, :code, :string, index: true
  end
end
