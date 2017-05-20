class AddResquestTypeToResquestCriminal < ActiveRecord::Migration
  def change
    add_reference :resquest_criminals, :resquest_type, index: true, foreign_key: true
  end
end
