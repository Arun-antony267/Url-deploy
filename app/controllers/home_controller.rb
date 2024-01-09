class HomeController < ApplicationController
  def index
    if $id.present?
      user = ShortUrl.where(user_id: $id).count
      puts($id)
      puts(user)
      $short_count = user
    else
      flash[:message] = "session expired please log in again "
      redirect_to controller: :user, action: :login
    end
  end

  def new
    if $id.present?
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def show
    if $id.present?
    else
      redirect_to root_path, notice: "Please Login First"
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
    if $id.present?
      @page = params.fetch(:page, 0).to_i
      @short_url = ShortUrl.where(user_id: $id).offset(@page * 24).limit(25)
      urls = ShortUrl.where(user_id: $id)
      @user_details = User.find_by(id: $id)
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ShortUrlPdf.new(urls, @user_details)
          send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
        end
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def file
    if params[:file].present?
      $file = params[:file]
      $file_content = $file.read
      $file_name = $file.original_filename
      if is_csv_file?($file)
        redirect_to controller: :file, action: :uploadFile
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
    $multi_url = @input.split(",")
    $size = $multi_url.size
    redirect_to :action => "show"
  end

  def show
    if $size.present?
      job_id = SecureRandom.uuid[0..2]
      0.upto($size - 1) do |n|
        $original_url = $multi_url[n]
        puts $multi_url[n]

        if $multi_url[n] =~ /\A#{URI::regexp(["http", "https"])}\z/
          @array = $original_url
          @display = "https://url-shortner-s7ah.onrender.com/i?q="
          $string = SecureRandom.uuid[0..6]
          $original_url = $original_url
          $shortened_url = @display + $string
          short_url = ShortUrl.new(user_id: $id, original_url: $original_url, shortened_url: $shortened_url, job_id: job_id)

          if short_url.save
            @short_url = ShortUrl.where(job_id: job_id)
            @original_url = $original_url
            @shortened_url = $shortened_url
            flash[:message] = "created succesfully."
          else
            redirect_to root_path, notice: "!!!!ERROR!!!!"
          end
        else
          flash[:message] = "Invalid url"
          render "new"
        end
      end
    end
  end

  # def lookup_code
  #   @display = "https://url-shortner-s7ah.onrender.com/i?q="
  #   $string = SecureRandom.uuid[0..6]
  #   $original_url = $original_url
  #   $shortened_url = @display + $string
  #   redirect_to :action => "create"
  # end

  # def create
  #   short_url = ShortUrl.new(user_id: $id, original_url: $original_url, shortened_url: $shortened_url)

  #   if short_url.save
  #     @short_url = short_url
  #     @original_url = $original_url
  #     @shortened_url = $shortened_url
  #     flash[:message] = "created succesfully."
  #     render "show"
  #   else
  #     redirect_to root_path, notice: "!!!!ERROR!!!!"
  #   end
  # end

end
