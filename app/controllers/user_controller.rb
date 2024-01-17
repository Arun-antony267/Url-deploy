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
    @user_details = User.find_by(id: $id)
    urls = ShortUrl.where(user_id: $id)
    @last_url = urls.last
    @count = urls.count
    @most_repeated_data = ShortUrl.group(:original_url).count.max_by { |_, count| count }
    if @most_repeated_data != nil
      @repeated_url_list = ShortUrl.where(original_url: @most_repeated_data.first)
      @dates = urls.pluck("created_at")
      @group_by_date = urls.group(:created_at).select("MAX(original_url) as original_url,
       MAX(shortened_url) as shortened_url,
       MAX(created_at) as created_at")
      @dates_grp = @dates.tally.select { |_, count| count > 0 }.keys
      respond_to do |format|
        format.html
        format.pdf do
          pdf = UserDetailsPdf.new(@user_details, @last_url)
          send_data pdf.render, filename: "user.pdf", type: "application/pdfs", disposition: "inline"
        end
      end
      puts "??????????#{@last_url.original_url}///////////"
      puts "The most repeated data in the original_url column is: #{@most_repeated_data.first} (#{@most_repeated_data.last} occurrences)."
      puts @repeated_url_list
      puts @dates_grp
    end
  end

  def history
    file_dates = UrlFile.pluck("created_at")
    file = UrlFile.find_by(created_at: params[:date])
    puts file
    puts file_dates
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
