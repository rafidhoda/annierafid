json.extract! rsvp, :id, :first_name, :last_name, :email, :phone_number, :comments, :created_at, :updated_at
json.url rsvp_url(rsvp, format: :json)
