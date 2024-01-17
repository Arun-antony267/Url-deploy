class FileController < ApplicationController
  require "csv"
  @@jobs = Array.new
  @@job_id = Array.new
  @@name_array = Array.new

  def upload
    if $id.present?
      $jobs_array = @@jobs
      $animation_duration = $file_size
      puts "Animation duration is : #{$animation_duration}"
      puts "File Job array is : #{@@jobs}"
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def files
    if $id.present?
      $name_array = @@name_array
      count = UrlFile.count
      $file_id = UrlFile.all.ids
      0.upto(count - 1) do
        $file_name = UrlFile.find_by(id: $file_id[count = count - 1])
        a = @@name_array.push($file_name.name)
        puts $name_array
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def check
    file_name = params[:file_name]
    name = file_name + ".csv"
    file = UrlFile.find_by(name: name)
    if file.present?
      job_id = file.job_id
      @short_url = ShortUrl.where(job_id: job_id)
      puts " job id is: #{job_id}"
      render "file_result"
    else
      flash[:message] = "File not present. Don't Need Extension in file name"
      render "upload"
    end
  end

  def url_download
    if $id.present?
      file_name = params[:name]
      file = UrlFile.find_by(name: file_name)
      if file.present?
        job_id = file.job_id
        @short_url = ShortUrl.where(job_id: job_id)
        @user_details = User.find_by(id: $id)
        respond_to do |format|
          format.html
          format.pdf do
            pdf = ShortUrlPdf.new(@short_url, @user_details)
            send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
          end
        end
        render "file_result"
      else
        flash[:message] = "File not present. Don't Need Extension in file name"
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def search
    if $id.present?
      file_name = params[:name]
      file = UrlFile.find_by(name: file_name)

      if file.present?
        job_id = file.job_id
        @short_url = ShortUrl.where(job_id: job_id)
        @user_details = User.find_by(id: $id)

        respond_to do |format|
          format.html
          format.pdf do
            pdf = ShortUrlPdf.new(@short_url, @user_details)
            send_data pdf.render, filename: "shorturl.pdf", type: "application/pdf", disposition: "inline"
          end
        end
      else
        flash[:message] = "File not present. Don't Need Extension in file name"
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def file_result
    if $id.present?
      @@job_id = params[:jobs]
      job_id = ShortUrl.last

      @short_url = ShortUrl.where(job_id: job_id.job_id)
      @user_details = User.find_by(id: $id)
      puts "Short urls are: #{@short_url}"
      puts "Job id is : #{@@job_id}"
      puts "Job id is #{job_id.job_id}"
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ShortUrlPdf.new(@short_url, @user_details)
          send_data pdf.render, filename: "shorturl.pdf", type: "application/pdfs", disposition: "inline"
        end
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def uploadJob
    file = params[:file]
    $file_name = file.original_filename
    if is_csv_file?($file_name)
      file_content = file.read
      $file_size = file.size.to_s
      $animation_duration = $file_size[0]
      num = SecureRandom.hex(4)
      @post = UrlFile.new(name: file.original_filename, attachment: file, job_id: num)
      if @post.save
        file_strip = file_content.split
        line_count = file_strip.count
        $job_id = FileHandleJob.perform_async(file.original_filename, file_strip, line_count, $id, num)
        a = @@jobs.push(num)
        puts "Size of the file is: #{$file_size[0]}"
        puts "Ainmation time is : #{$animation_duration}"
        render "upload"
      else
        flash[:message] = "File Not uploaded"
        render "upload"
      end
    else
      flash[:message] = "Invalid File"
      render "upload"
    end
  end

  def is_csv_file?(file)
    extension = File.extname(file)
    return extension.downcase == ".csv"
  end

  def uploadFile
    if $id.present?
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
        redirect_to :action => "full"
      else
        flash[:message] = "File not saved"
        redirect_to controller: :home, action: :new
      end
    else
      redirect_to root_path, notice: "Please Login First"
    end
  end

  def full
    time = Time.now.utc
    if $line_count.present?
      puts "line count is: #{$line_count}"
      0.upto($line_count) do |n|
        if $file_strip[n] =~ /\A#{URI::regexp(["http", "https"])}\z/&& ($original_url =~ /\Ahttps:\/\/.+\z/)
          display = "https://url-shortner-s7ah.onrender.com/i?q="
          string = SecureRandom.uuid[0..6]
          file_srt_url = display + string
          file_og_url = $file_strip[n]
          @save_url = ShortUrl.new(user_id: $id, original_url: file_og_url, shortened_url: file_srt_url)
          if @save_url.save
            @short_url = ShortUrl.where("created_at > ?", time)
          end
        else
          flash[:message] = "File Contains Invalid url"
          break
        end
      end
    end
    @user_details = User.find_by(id: $id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ShortUrlPdf.new(@short_url, @user_details)
        send_data pdf.render, filename: "shorturl.pdf", type: "application/pdf", disposition: "inline"
      end
    end
    render "uploadFile"
  end

  private

  def file_params
    params.permit(:file)
  end
end
