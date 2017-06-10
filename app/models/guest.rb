class Guest < ApplicationRecord
  belongs_to :rsvp, optional: true
end
