class OmniauthCallbacksController < ApplicationController
	def all
		auth = request.env["omniauth.auth"]

		user = User.from_omniauth(auth)

		if user_signed_in?
			redirect_to root_path, notice: "You are already signed in!"
		else
			if user.persisted?
				sign_in_and_redirect user, notice: "Welcome #{user.name}!"
			else
				session["devise.user_attributes"] = user.attributes
				redirect_to edit_user_registration_url, notice: "Please finish your registration"
			end
		end
	end	

	alias_method :facebook, :all
end
