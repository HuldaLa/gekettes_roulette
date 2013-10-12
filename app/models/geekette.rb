class Geekette < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :birth_date, :urls, :photo_urls, :buisness_city, :interests, :external_ids, :email
end
