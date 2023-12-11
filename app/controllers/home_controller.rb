class HomeController < ApplicationController
  def index
    if $id.present?
      user = ShortUrl.where(user_id: $id).count
      puts($id)
      puts(user)
      $short_count = user
    else
      flash[:message] = "session expired please log in again "
      redirect_to controller: :user, action: :check_login
    end
  end

  def redirect_to_original
    short_url = params[:q]
    full_url = "https://url-shortner-s7ah.onrender.com/i?q=" + short_url
    user = ShortUrl.find_by(shortened_url: full_url)
    url_og = user.original_url
    redirect_to url_og, allow_other_host: true
  end

  def view
    @short_url = ShortUrl.where(user_id: $id)
    @user_details = User.find_by(id: $id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ShortUrlPdf.new(@short_url, @user_details)
        send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
      end
    end
  end

  def file
    if params[:file].present?
      $file = params[:file]
      $file_content = $file.read
      $file_name = $file.original_filename
      if is_csv_file?($file)
        redirect_to controller: :pdf, action: :uploadFile
      else
        flash[:message] = "Invalid File"
        render "new"
      end
    else
      flash[:message] = "Invalid File"
      render "new"
    end
  end

  def is_csv_file?(file_path)
    extension = File.extname(file_path)

    return extension.downcase == ".csv"
  end

  def multi_line
    @input = params[:multi_url]
    $after = @input.split(",")
    $size = $after.size
    redirect_to :action => "next"
  end

  def next
    if $size.present?
      $size = $size - 1
      $original_url = $after[$size]

      if $size != -1
        if $original_url.present?
          if $original_url =~ /\A#{URI::regexp(["http", "https"])}\z/
            @array = $original_url
            redirect_to :action => "lookup_code"
          else
            flash[:message] = "Invalid url"
            render "new"
          end
        else
          flash[:message] = "No url Present"
          render "new"
        end
      else
        flash[:message] = "No More url"
        render "new"
      end
    else
      flash[:message] = "No More url"
      render "new"
    end
  end

  def lookup_code
    @display = "https://url-shortner-s7ah.onrender.com/i?q="
    $string = SecureRandom.uuid[0..6]
    $original_url = $original_url
    $shortened_url = @display + $string
    redirect_to :action => "create"
  end

  def create
    @Short_url = ShortUrl.new(user_id: $id, original_url: $original_url, shortened_url: $shortened_url)

    if @Short_url.save
      @original_url = $original_url
      @shortened_url = $shortened_url
      flash[:message] = "created succesfully."
      render "show"
    else
      redirect_to root_path, notice: "!!!!ERROR!!!!"
    end
  end

  def ogurl

    # @original_url = $original_url.to_json
    render json: $original_url.to_json
  end

  def srtUrl

    # @shortened_url = $shortened_url.to_json
    render json: $shortened_url.to_json
  end
end
