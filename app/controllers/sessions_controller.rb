class SessionsController < ApplicationController
  def new
  end

  def create
  	respond_to do |format|
	  	user = User.find_by_email(params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      # Sign the user in and redirect to the user's show page.
	      sign_in(user)
	      format.html { redirect_back_or user }
	      format.json { head :no_content }
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	  	  format.html { render action: "new" }
	      format.json { head :no_content }
	    end
	end
  end

  def destroy
  	sign_out
  	respond_to do |format|
	  format.html { redirect_to root_url }
	  format.json { head :no_content }
  	end
  end
end
