class RenameDistrictToResquestCriminal < ActiveRecord::Migration
  def change
    rename_column :resquest_criminals, :district_send, :district_send_id
    rename_column :resquest_criminals, :district_resquest, :district_resquest_id
  end
end
