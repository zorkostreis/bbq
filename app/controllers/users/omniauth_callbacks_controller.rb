class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_for_github_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Github')
      
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('omniauth_callbacks.failure', kind: 'Github')

      redirect_to new_user_session_path
    end
  end
end
