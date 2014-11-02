class AccessController < ApplicationController
  
  layout 'admin'
  
  def index
    #display text & links
  end

  def login
    #login form
  end

  def attempt_login
    # present? is a rails method
    # make sure we have both values, username and password
    if params[:username].present? && params[:password].present?
      # go to AdminUser table to look for matching username and assign it to found_user
      # if username not found, result will be nil 
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        # check if found_user can be authenticated
        # authorized_user can be object or false
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # TODO: add mark user as logged in logic here too
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
