class AuthenticationController < ApplicationController
require 'httparty'

def login
  @title = "Login"
end

def logout
  flash[:notice] = "That's all, folks!"
  delete_csl_app_token
  redirect_to login_path
end

def auth
  credentials = {auth: {email: params[:user][:email], password: params[:user][:password]}}.to_json
  request_auth = HTTParty.post("http://localhost:3001/user_token", body: credentials, headers: {"Content-Type" => "application/json"})

  if request_auth.code < 300
    @csl_app_token = request_auth.parsed_response['jwt']
    p @csl_app_token
  else
    flash[:error] = "Getting token failed"
    redirect_to login_path
  end

  unless @csl_app_token.nil?
    flash[:notice] = "Successfully logged in"
    set_csl_app_token(@csl_app_token)
    redirect_to switches_path
  else
    flash[:error] = "Wrong credentials."
    redirect_to login_path
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
