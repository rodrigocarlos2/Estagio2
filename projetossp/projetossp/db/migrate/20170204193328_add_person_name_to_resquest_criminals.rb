class AddPersonNameToResquestCriminals < ActiveRecord::Migration
  def change
    add_column :resquest_criminals, :person_name, :string
  end
end
