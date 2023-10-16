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
    render 'login'
    # redirect_to root_path, notice: "account created succesfully."
  else
      @dis = 'ERROR !!! Invalid input'
   
      render :signup
  end
end

def check_login
email = params[:email]
pass = params[:password]

@user = User.find_by(email: email)
if @user && @user.authenticate(pass)
  $name =@user.name
  # $dis = 'password is correct'
  redirect_to controller: :home, action: :new
else
  @dis = '!!!OOPS not going anywhere'
  render 'login'
end

end 


  private

  def user_params
      params.permit(:name, :email, :password, :password_confirmation)
   end

end
