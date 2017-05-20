class AddAvatarToImageReports < ActiveRecord::Migration
  def change
    add_column :image_reports, :avatar, :string
  end
end
