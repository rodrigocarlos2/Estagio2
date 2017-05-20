class CreateImageReports < ActiveRecord::Migration
  def change
    create_table :image_reports do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
