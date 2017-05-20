class AddResquestTypeToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :resquest_type, index: true, foreign_key: true
  end
end
