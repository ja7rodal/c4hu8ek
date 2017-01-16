class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	def authenticate
		user = User.find_by email: request.headers['X-User-Email'];
		
		if user.api_token != request.headers['X-Api-Token']
			render json: { error: "Denied" }, status: 401			
		else
			return true
		end
		
	end
	
end
