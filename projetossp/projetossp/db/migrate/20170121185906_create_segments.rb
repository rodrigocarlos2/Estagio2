class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
