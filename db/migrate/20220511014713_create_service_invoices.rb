class CreateServiceInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :service_invoices do |t|

      t.timestamps
    end
  end
end
