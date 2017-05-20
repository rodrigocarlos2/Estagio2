class CreateResquestCriminals < ActiveRecord::Migration
  def change
    create_table :resquest_criminals do |t|
      t.integer :district_resquest
      t.integer :district_send
      t.references :user, index: true, foreign_key: true
      t.integer :type
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
