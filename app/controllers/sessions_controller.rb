class SessionsController < ApplicationController
  def new
  end


  def create
    # We have the users email and password from the params
    #1. first find the user by their email
    #2. if found, we authenticate the user with the given password
    #3. if authentication not successful, we alert the user with wrong credentionls
    user = User.find_by(email: params[:email])



    # user && user.authenticate(params[:password])
    #& can be used in place of the dot operator when calling methods on objects. it gives us a way to against noMethod for nil:class errors. It will immeditely return `nil` instead of calling the method after it unless the object before is not ''
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Thank you for signing in! ❤️'
    else
      flash.now[:alert] =  'Wrong email or password!!!'
      render :new
    end

  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Singed out!!'
  end
end
