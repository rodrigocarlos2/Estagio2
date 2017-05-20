class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.text :description
      t.boolean :default

      t.timestamps null: false
    end
  end
end
