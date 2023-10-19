class DataFile < ActiveRecord::Base

    # def original_url_format
    #     uri = URI.parse(orginal_url || "")
    #     if uri.host.nil?
    #         errors.add(:original_url, "Invalid URL format")
    #     end
    # end
    
    def self.save(upload)

        @pdf = $file
        name = upload[@pdf]
        directory = "/home/arun/Downloads"
        # create the file path
        path = File.join(directory, name)
        # write the file
        aFile = File.open(path, "r")
        $value  = IO.readlines(aFile)
       
       
    end
    

end