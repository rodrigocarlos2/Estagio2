class AddStatusToResquestCriminal < ActiveRecord::Migration
  def change
    add_column :resquest_criminals, :status, :integer, default: 0
  end
end
