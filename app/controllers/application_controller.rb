class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def return_to_back(resource)
    flash[:danger] = resource.errors.full_messages
    redirect_to request.referer
  end
end
