class AddCustomerColums < ActiveRecord::Migration
  def change
    add_column :customers, :email, :string
    add_column :customers, :name, :string
  end
end
