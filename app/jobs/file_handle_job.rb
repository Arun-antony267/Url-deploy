class FileHandleJob
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(file_name, file_strip, line_count, id, job_id)
    if line_count.present?
      0.upto(line_count) do |n|
        if file_strip[n] =~  /\A#{URI::regexp(["http", "https"])}\z/&& (file_strip[n]  =~ /\A(?:http|https):\/\/.+\z/)
          display = "https://url-shortner-s7ah.onrender.com/"
          string = SecureRandom.uuid[0..6]
          file_srt_url = display + string
          file_og_url = file_strip[n]
          @save_url = ShortUrl.new(user_id: id, original_url: file_og_url, shortened_url: file_srt_url, job_id: job_id)
          if @save_url.save
            puts "Saved to Shorturl table"
            puts "Url number is #{[n]}"
            puts "#{file_srt_url}"
          else
            puts "Short urls not saved"
          end
        end
      end
    end
    puts "////////#{job_id}/////////"
    return true
  end
end
