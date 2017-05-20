class AddDateRegistrationToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_registration, :datetime
  end
end
