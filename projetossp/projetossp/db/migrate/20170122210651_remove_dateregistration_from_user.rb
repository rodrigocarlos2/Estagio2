class RemoveDateregistrationFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :dateregistration, :string
  end
end
