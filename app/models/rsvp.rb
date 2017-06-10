class Rsvp < ApplicationRecord
  has_many :guests, dependent: :destroy
  accepts_nested_attributes_for :guests, allow_destroy: true, reject_if: :all_blank
end
