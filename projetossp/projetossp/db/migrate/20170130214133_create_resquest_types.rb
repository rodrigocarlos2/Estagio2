class CreateResquestTypes < ActiveRecord::Migration
  def change
    create_table :resquest_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
