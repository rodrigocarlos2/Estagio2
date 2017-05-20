class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :resquest_criminal, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
