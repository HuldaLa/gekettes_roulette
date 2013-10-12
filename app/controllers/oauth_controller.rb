class OauthController < ApplicationController

  before_filter :set_consumer

  def sign_up
    request_token = @consumer.get_request_token(oauth_callback: 'http://localhost:3000/callback')
    session[:token] = request_token.token
    session[:secret] = request_token.secret
    # print request_token
    redirect_to request_token.authorize_url
  end  

  def contact_request 
    @consumer.get_request_token(oauth_callback: 'http://localhost:3000/callback')
    #@access_token.request(:get, "https://api.xing.com/v1/user/#{params[:user_id]}/contact_request")
  end

  def callback
    request_token = OAuth::RequestToken.new(@consumer, session[:token], session[:secret])
    @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier]) 

    result = @access_token.request(:get, "https://api.xing.com/v1/users/me")
    json = JSON(result.body)

    person = json['users'][0]
    @geekette =  Geekette.find_or_create_by_email( person['active_email']) do |gk|
      # gk.first_name = person['first_name']
      gk.last_name = "#{person['first_name']} #{person['last_name']}"
      gk.gender = person['gender']
      gk.birth_date = "#{person['birth_date']['year']}-#{person['birth_date']['month']}-#{person['birth_date']['day']}"
      gk.urls = {
        homepage: (person['urls'].present? ? person['urls']['homepage'] : ''),
        twitter:  (person['urls'].present? ? person['urls']["twitter"] : '' )
      }.to_json
      gk.external_ids = {
        xing: person['page_name']
      }.to_json
      gk.photo_urls = {
        large:        person['photo_urls']["large"],
        maxi_thumb:   person['photo_urls']["maxi_thumb"],
        medium_thumb: person['photo_urls']["medium_thumb"],
        mini_thumb:   person['photo_urls']["mini_thumb"],
        thumb:        person['photo_urls']["thumb"]
      }.to_json
      gk.buisness_city = person['business_address']['city']
      gk.interests = "#{person['interests']} #{person['haves']}"
    end

    redirect_to geekette_path(@geekette)
  end

  private

  def set_consumer
    @consumer = OAuth::Consumer.new("6a72b7a5fa3bbdf9864c", "e8d8427a9340643c34dfed9a0ae34fb3c5a52328", {
      :site => "https://api.xing.com",
      :request_token_path => "/v1/request_token",
      :authorize_path => "/v1/authorize",
      :access_token_path => "/v1/access_token"
    })
  end
 
end