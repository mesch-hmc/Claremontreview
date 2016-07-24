class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # Require 5C edu email
      if (@user.email =~ /.+@(g\.hmc|hmc|cmc|claremontmckenna|pitzer|scrippscollege|mymail\.pomona|pomona)\.edu/)
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        sign_out_and_redirect @user
        @user.destroy
        flash[:warning] = "Sign in failed : Claremont Colleges .edu email address required"
      end
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
