class UserController < ApplicationController
  def signup
    @user = User.new
  end

  def login
    $id = nil
    render "login"
  end

  def users
    @user = User.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = UsersPdf.new(@user)
        send_data pdf.render, filename: "user.pdf", type: "application/pdfs", disposition: "inline"
      end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:message] = "Your Account was Created Successfully"
      render "login"
    else
      flash[:message] = "ERROR !!! Invalid input"

      render :signup
    end
  end

  def check_login
    email = params[:email]
    pass = params[:password]
    @user = User.find_by(email: email)

    if @user && @user.authenticate(pass)
      $name = @user.name
      $id = @user.id
      flash[:message] = "Logged In Succesfully"
      redirect_to controller: :home, action: :index
    else
      flash[:message] = "!!!OOPS not going anywhere"
      render "login"
    end
  end

  def details
    if $id.present?
      @user_details = User.find_by(id: $id)
      urls = ShortUrl.where(user_id: $id)
      @last_url = urls.last
      @count = urls.count
      @most_repeated_data = urls.group(:original_url).count.max_by { |_, count| count }
      if @most_repeated_data != nil
        @repeated_url_list = urls.where(original_url: @most_repeated_data.first)
        @dates = urls.pluck("DATE(created_at)")
        @dates_grp = @dates.uniq
        respond_to do |format|
          format.html
          format.pdf do
            pdf = UserDetailsPdf.new(@user_details, @last_url)
            send_data pdf.render, filename: "user.pdf", type: "application/pdfs", disposition: "inline"
          end
        end
        puts @dates_grp
        puts "//////////////#{@dates}//////////"
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def history
    @date = params[:date].to_date
    @file_all = UrlFile.all
    urls = ShortUrl.where(user_id: $id)
    @file = UrlFile.where(created_at: @date.beginning_of_day..@date.end_of_day)
    @group_by_date = urls.where(created_at: @date.beginning_of_day..@date.end_of_day).paginate(page: params[:page], per_page: 15)
    puts "///////////////////"
    puts @file
    puts "/////////////////////"
    puts @file_all
    puts "/////////////////"
    puts @group_by_date
  end

  def delete_urls
    user = User.find_by(id: params[:id])
    delete_urls = ShortUrl.where(user_id: user.id)
    delete_files = UrlFile.where(user_id: user.id)
    delete_files.delete_all
    delete_urls.delete_all
    puts user.name
    puts delete_urls.count
    redirect_to "/home/index", notice: "All files and ShortUrl is deleted"
  end

  def delete_urls_confirm
    user = User.find_by(id: params[:id])
    delete_urls = ShortUrl.where(user_id: user.id)
    delete_files = UrlFile.where(user_id: user.id)
    redirect_to "/user/details", confirm: "This will delete #{delete_files.count} Files and #{delete_urls.count} urls"
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
