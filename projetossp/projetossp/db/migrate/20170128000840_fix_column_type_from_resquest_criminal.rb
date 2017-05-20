class FixColumnTypeFromResquestCriminal < ActiveRecord::Migration
  def change
    rename_column :resquest_criminals, :type, :resquest_type
  end
end
