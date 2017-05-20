class RemoveResquestTypeToResquestCriminal < ActiveRecord::Migration
  def change
    remove_column :resquest_criminals, :resquest_type, :integer
  end
end
