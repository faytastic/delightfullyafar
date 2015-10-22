class Article < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	acts_as_taggable
  belongs_to :user
  has_many :attachments, as: :attachable, dependent: :destroy
end
