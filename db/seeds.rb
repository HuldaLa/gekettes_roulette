# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Geekette.create( [{
  first_name: 'Diana',
  last_name: 'Knodel',
  gender: 'f',
  birth_date: '1981-06-26',
  urls: {
    homepage: ["http://about.me/diana.knodel"],
    twitter:  ["https://twitter.com/DianaKnodel"]
  }.to_json,
  photo_urls: {
    large:        "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.140x185.jpg",
    maxi_thumb:   "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.70x93.jpg",
    medium_thumb: "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.57x75.jpg",
    mini_thumb:   "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.18x24.jpg",
    thumb:        "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.30x40.jpg"
  }.to_json,
  message: 'Do IT',
  buisness_city: 'Hamburg',
  interests: 'UX, Webdesign'
}] )
