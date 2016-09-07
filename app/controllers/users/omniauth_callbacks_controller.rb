class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            if (@user.email =~ /.+@.*.edu/)
                flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
                sign_in_and_redirect @user, :event => :authentication
            else
                flash[:warning] = "Failure: edu email required"
                redirect_to root_url
            end
        else
            session["devise.google_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
end
