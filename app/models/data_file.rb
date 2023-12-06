class DataFile < ActiveRecord::Base
    require 'csv'

    def self.save(upload)

        # $csv = File.new($file, "r")
        # $parsed_data = CSV.parse($csv)
        # $parsed_data.each do |row|
        #   $f_url = row[1]     
        # end
       
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