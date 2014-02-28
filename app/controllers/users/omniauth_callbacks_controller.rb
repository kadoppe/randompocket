class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def pocket
    @user = User.find_for_pocket_oauth(env['omniauth.auth'], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path
    end
  end
end
