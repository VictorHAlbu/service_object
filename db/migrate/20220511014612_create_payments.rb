class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
