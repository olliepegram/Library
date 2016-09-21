class Book < ApplicationRecord
  belongs_to :user

  has_many :comments

  mount_uploader :picture, BookPictureUploader

  #Add ratable method... dd the ratyrate_rateable function with its dimensions option
  ratyrate_rateable "review"
end
