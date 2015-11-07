class UserMemberNumber < ActiveRecord::Migration
  def change
    add_column :customers, :member_number, :string
  end
end
