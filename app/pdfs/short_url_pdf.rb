class ShortUrlPdf < Prawn::Document

    def initialize(short_url)
    super()
    @short_url = short_url
    generate_pdf
    end

    def generate_pdf
        table short_url_all do
          row(0).font_style = :bold
          columns(1..2).align = :center
        end
      end


    def short_url_all
    [["user ID","Original url","Shortened url"]] +
    @short_url.map do |short_url|
        [short_url.user_id, short_url.original_url, short_url.shortened_url]
    end
    end
end