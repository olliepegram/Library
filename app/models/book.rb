class Book < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, BookPictureUploader
end
