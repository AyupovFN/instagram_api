class AuthController < ApplicationController
  def instagram
    process_callback
  end
end

private

def process_callback
  oauth_data = request.env['omniauth.auth']

  user = sign_in_with_oauth_data(oauth_data) unless user_signed_in?
  user.register_social_profile(normalize_oauth_data(oauth_data), normalize_profile_data(oauth_data))

  redirect_to '/'
end


protected

def normalize_instagram_data(oauth_data)
  data = oauth_data.info
  { full_name: data.name, picture: data.image, username: data.nickname }
end