class AddReportToImageReport < ActiveRecord::Migration
  def change
    add_reference :image_reports, :report, index: true, foreign_key: true
  end
end
