class SessionsController < ApplicationController

  def bla
    signals = Signals.new(session[:token])
    @authorization = signals.authorization
    binding.pry  
    @people = signals.people
  end

  def new
  end

  def create
    @user = User.find_or_create_by_uid(
      uid: auth_hash["uid"],
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"]
    )    

    session[:token] = auth_hash["credentials"]["token"]
    session[:refresh_token] = auth_hash["credentials"]["refresh_token"]

    redirect_to '/'
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end