class Rsvp < ApplicationRecord
  has_many :guests, dependent: :destroy
  accepts_nested_attributes_for :guests, allow_destroy: true, reject_if: :all_blank

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
