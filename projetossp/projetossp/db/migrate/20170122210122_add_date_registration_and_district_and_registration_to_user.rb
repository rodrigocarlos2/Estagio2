class AddDateRegistrationAndDistrictAndRegistrationToUser < ActiveRecord::Migration
  def change
    add_column :users, :dateregistration, :datetime
    add_reference :users, :district, index: true, foreign_key: true
    add_column :users, :registration, :string
  end
end
