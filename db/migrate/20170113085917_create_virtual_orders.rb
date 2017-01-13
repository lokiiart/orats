class CreateVirtualOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :virtual_orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :product_count
      t.string :payment

      t.timestamps
    end
  end
end
