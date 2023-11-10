class DataFile < ActiveRecord::Base
    
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