class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.integer :gender
      t.string :phone
      t.string :cell_phone
      t.string :photo

      t.timestamps null: false
    end
  end
end
