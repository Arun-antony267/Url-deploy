class UserController < ApplicationController

  def signup 

      @user = User.new

  end

  def users   
    @user = User.all  
    respond_to do |format|
      format.html
      format.pdf do
        pdf = UsersPdf.new(@user)
        send_data pdf.render, filename: 'user.pdf', type: 'application/pdfs',disposition: "inline"
        end
      end 
  
  end 



 def create

  @user = User.new(user_params)

  if @user.save
    flash[:message] = "Your Account was Created Successfully"
    redirect_to controller: :home, action: :index
  else 
    flash[:message] = 'ERROR !!! Invalid input'
   
      render :signup
  end
end

def check_login
email = params[:email]
pass = params[:password]
@user = User.find_by(email: email)

if @user && @user.authenticate(pass)
  $name =@user.name
   flash[:message] = "Logged In Succesfully"
  redirect_to controller: :home, action: :new
else
  flash[:message] = "!!!OOPS not going anywhere"
  render 'login'
end

end 


  private

  def user_params
      params.permit(:name, :email, :password, :password_confirmation)
   end

end
