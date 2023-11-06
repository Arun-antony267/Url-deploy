class ShortUrl < ApplicationRecord

    def lookup
        code.to_s = SecureRandom.uuid[0..6]
        srt_url =  "https://test.tin.ee/"
        return(srt_url+ code)    
    end

end
