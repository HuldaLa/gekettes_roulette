class CreateGeekeettes < ActiveRecord::Migration
  def change
    create_table :geekeettes do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birth_date
      t.string :email
         
      t.text :urls
      # t.string :homepage_url
      # t.string :twitter_url
      # t.string :xing_url

      t.text :external_ids
      t.text :photo_urls

      t.string :buisness_city

      #     "professional_experience": {
      #       "primary_company": {
      #         "name": "XING AG",
      #         "url": null,
      #         "title": "Product Owner",
      #         "begin_date": "2013-09",
      #         "end_date": null
      #       },
            
      #     },
      #     "photo_urls": {
      #       "large": "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.140x185.jpg",
      #       "maxi_thumb": "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.70x93.jpg",
      #       "medium_thumb": "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.57x75.jpg",
      #       "mini_thumb": "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.18x24.jpg",
      #       "thumb": "https://x1.xingassets.com/img/users/3/2/d/d3360223d.6208727,8.30x40.jpg"
      #     },
      #     "permalink": "https://www.xing.com/profile/Diana_Knodel"
      
      t.text :interests

      t.timestamps
    end
  end
end
