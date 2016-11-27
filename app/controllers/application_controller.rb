class ApplicationController < ActionController::Base
  include Knock::Authenticable

  def set_csl_app_token(token)
    cookies[:csl_app_token] = {value: token}
  end

  def delete_csl_app_token
    cookies.delete :csl_app_token
  end
end
