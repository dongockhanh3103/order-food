class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :first_name, index: true
      t.string  :last_name, index: true
      t.string  :address
      t.string  :phone_number
      t.string  :email

      t.timestamps
    end
  end
end
