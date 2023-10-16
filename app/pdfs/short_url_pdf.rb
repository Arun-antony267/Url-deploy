class ShortUrlPdf < Prawn::Document
    def initialize(short_url)
    super()
    @short_url = ShortUrl.order("id ASC").all
    table short_url_all
    end


    def short_url_all
    [["id","Original url","Shortened url"]]
    @short_url.map do |short_url|
        [short_url.original_url,short_url.shortened_url]
    end
    end
end