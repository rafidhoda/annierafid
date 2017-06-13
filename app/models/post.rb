class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :post_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '500x500>',
  }

  validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/
end
