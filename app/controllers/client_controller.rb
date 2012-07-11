class ClientController < ApplicationController
  def upload
		uploaded_file = params[:apk_file]	
		File.open(Rails.root.join('/swidy/client', '', uploaded_file.original_filename), 'wb') do |file|
			file.write(uploaded_file.read)
		end
  end

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
	
  end
end
