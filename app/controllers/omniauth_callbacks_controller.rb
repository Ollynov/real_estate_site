class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # This User.from_omniauth method we defined inside of our user.rb (model file). The reason we defined it there,
    # is because this method is concerned with our DB. It checks the db to see if our User already exists. If they do,
    # then we need to log them in, and display a flash message. Otherwise, redirect to the new user registration page.
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_date"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url

    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
    end
  end




end

