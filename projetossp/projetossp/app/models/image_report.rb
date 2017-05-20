class ImageReport < ActiveRecord::Base
	belongs_to :report
	mount_uploader :avatar, AvatarUploader
end
