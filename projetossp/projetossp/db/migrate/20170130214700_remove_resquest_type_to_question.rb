class RemoveResquestTypeToQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :resquest_type, :integer
  end
end
