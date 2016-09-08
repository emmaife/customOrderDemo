class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
