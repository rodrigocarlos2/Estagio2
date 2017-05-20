class RenameTypeToResquestTypeFromQuestion < ActiveRecord::Migration
  def change
    rename_column :questions, :type, :resquest_type
  end
end
