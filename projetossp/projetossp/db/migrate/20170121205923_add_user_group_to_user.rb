class AddUserGroupToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_group, index: true, foreign_key: true, default: 0
  end
end
