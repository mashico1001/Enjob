class ApplicationController < ActionController::Base

before_action :authenticate_user!,expect: [:top]
before_action :configure_permitted_parameters, if: :devise_controller?


protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

 def unchecked_notifications
    @notifications = current_user.notifications.where(checked: false)
 end


end
