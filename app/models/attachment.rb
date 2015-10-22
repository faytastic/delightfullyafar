class Attachment < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
  belongs_to :attachable, polymorphic: true
end
