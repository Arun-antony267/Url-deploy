class FileController < ApplicationController
  require "csv"

  def uploadFile
    @post = UrlFile.new(name: $file_name, attachment: $file)
    if @post.save
      $file_strip = $file_content.split
      $line_count = $file_strip.count
      $file_s = $file_strip.each do |row|
        if $line_count.present?
          $size_pdf = $line_count
        else
          flash[:message] = "Line count not present"
        end
      end
      # redirect_to :action => "new_line"
      # redirect_to :action => "full"
      time = Time.now.utc
      while $size_pdf != 0
        $size_pdf = $size_pdf - 1
        $element = $file_s[$size_pdf]
        $element =~ /\A#{URI::regexp(["http", "https"])}\z/
        @display = "https://url-shortner-s7ah.onrender.com/i?q="
        @string = SecureRandom.uuid[0..6]
        $file_og_url = $element
        $file_srt_url = @display + @string
        flash[:message] = "Valid url"
        @save_url = ShortUrl.new(user_id: $id, original_url: $file_og_url, shortened_url: $file_srt_url)
        if @save_url.save
          @short_url = ShortUrl.where("created_at > ?", time)
        end
      end
      # render "full"
      @user_details = User.find_by(id: $id)
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ShortUrlPdf.new(@short_url, @user_details)
          send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
        end
      end
    else
      flash[:message] = "File not saved"
      redirect_to controller: :home, action: :new
    end
  end

  # def new_line
  def full
    time = Time.now.utc
    while $size_pdf != -1
      $size_pdf = $size_pdf - 1
      $element = $file_s[$size_pdf]
      $element =~ /\A#{URI::regexp(["http", "https"])}\z/
      @display = "https://url-shortner-s7ah.onrender.com/i?q="
      @string = SecureRandom.uuid[0..6]
      $file_og_url = $element
      $file_srt_url = @display + @string
      flash[:message] = "Valid url"
      @save_url = ShortUrl.new(user_id: $id, original_url: $file_og_url, shortened_url: $file_srt_url)
      if @save_url.save
        @short_url = ShortUrl.where("created_at > ?", time)
      end
    end
    render "full"
    @user_details = User.find_by(id: $id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ShortUrlPdf.new(@short_url, @user_details)
        send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
      end
    end
  end

  def shorten
    @display = "https://url-shortner-s7ah.onrender.com/i?q="
    @string = SecureRandom.uuid[0..6]
    $file_og_url = $element
    $file_srt_url = @display + @string
    flash[:message] = "Valid url"
    redirect_to :action => "display"
  end

  def display
    @Short_url = ShortUrl.new(user_id: $id, original_url: $file_og_url, shortened_url: $file_srt_url)

    if @Short_url.save
      @original_url = $file_og_url
      @shortened_url = $file_srt_url
      flash[:message] = "created succesfully."

      # render "upload"
      render "full"
    else
      redirect_to root_path, notice: "!!!!ERROR!!!!"
    end
  end

  def fileOgUrl
    @file_original_url = $file_og_url.to_json
    render json: @file_original_url
  end

  def fileSrtUrl
    @file_shortened_url = $file_srt_url.to_json
    render json: @file_shortened_url
  end

  private

  def file_params
    params.permit(:file)
  end
end
