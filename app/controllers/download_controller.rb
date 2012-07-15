class DownloadController < ApplicationController
     def down_file  
	   
          send_file "/swidy/client/"+params[:filename] unless params[:filename].blank?    
   
	   end 
end
