class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      add_default_friends
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

 alias_method :passthru, :facebook

 private

 def add_default_friends
  if @user.friends.length == 0 
    Friendship.create(user_id: @user.id, friend_id: 0)
    Friendship.create(user_id: @user.id, friend_id: 1)
    Friendship.create(user_id: @user.id, friend_id: 2)
    Friendship.create(user_id: @user.id, friend_id: 3)
    Friendship.create(user_id: @user.id, friend_id: 4)    
  end
end

end
