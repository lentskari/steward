class AddUberTokensToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :uber_access_token, :string
    add_column :customers, :uber_refresh_token, :string
    add_column :customers, :uber_token_expires, :datetime
  end
end
