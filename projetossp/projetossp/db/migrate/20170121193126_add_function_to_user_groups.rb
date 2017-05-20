class AddFunctionToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :function, :integer, default: 0
  end
end
