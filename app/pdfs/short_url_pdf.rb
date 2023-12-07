class ShortUrlPdf < Prawn::Document

    def initialize(short_url, user_details)
    super()
    @short_url = short_url
    @user_details= user_details
    generate_pdf
    end

    def generate_pdf
      text "User Name: #{@user_details.name}", size: 14, style: :bold, align: :left
      text "User Id : #{@user_details.id}",size: 14, style: :bold, align: :left
      move_down 10
      table short_url_all do
          row(0).font_style = :bold
          columns(1..2).align = :center
        end
      end


    def short_url_all
    [["user ID","Original url","Shortened url"]] +
    @short_url.map do |short_url|
      [@user_details.name]
        [short_url.user_id, short_url.original_url, short_url.shortened_url]
     end 
    end
end