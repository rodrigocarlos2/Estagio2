class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.references :district, index: true, foreign_key: true
      t.string :name
      t.string :public_place
      t.string :city
      t.string :state
      t.string :cep
      t.string :phone
      t.string :email
      t.string :neighborhood
      t.string :second_phone

      t.timestamps null: false
    end
  end
end
